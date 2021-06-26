package com.ssm.framework.commonDao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.lang.reflect.Method;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ssm.entity.Tuser;
import com.ssm.framework.commonUtil.DataUtil;
import com.ssm.framework.commonUtil.MenuUtil;
import com.ssm.framework.commonUtil.PageModel;

/**
 * @author Administrator
 * @param <T>
 */
public class BaseDao<T> {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * 简单通用的JDBC封装.
	 * 
	 * @param <T>
	 */
	private List<Method> matchPojoMethods(T entity, String methodName) {
		Method[] methods = entity.getClass().getDeclaredMethods();
		List<Method> list = new ArrayList<Method>();
		for (int index = 0; index < methods.length; index++) {
			if (methods[index].getName().indexOf(methodName) != -1) {
				list.add(methods[index]);
			}
		}
		return list;
	}

	public String getString(Method method, T entity) throws Exception {
		return (String) method.invoke(entity, new Object[] {});
	}

	public Integer getInt(Method method, T entity) throws Exception {
		return (Integer) method.invoke(entity, new Object[] {});
	}

	/**
	 * 
	 * @param entity
	 * @return boolean
	 * @throws Exception
	 */
	public boolean update(T entity) throws Exception {
		boolean flag = false;
		String sql = "update " + entity.getClass().getSimpleName().toLowerCase() + " set ";
		// 获得该类所有get方法对象合集
		List<Method> list = this.matchPojoMethods(entity, "get");
		// 临时Method对象
		Method tempMethod = null;
		// 按顺序将ID移到最后
		Method idMethod = null;
		Iterator<Method> iter = list.iterator();
		while (iter.hasNext()) {
			tempMethod = iter.next();
			// 如果方法名中带有ID字符串并且长度为2,则视为ID
			if (tempMethod.getName().lastIndexOf("Id") != -1 && tempMethod.getName().substring(3).length() == 2) {
				// 把ID字段的对象存放到一个变量中,然后在集合中删掉
				idMethod = tempMethod;
				iter.remove();
				// 如果方法名去掉set/get字符串以后与pojo + "id"符合(大小写不敏感),则视为ID
			} else if ((entity.getClass().getSimpleName() + "Id").equalsIgnoreCase(tempMethod.getName().substring(3))) {
				idMethod = tempMethod;
				iter.remove();
			}
		}
		// 鎶婅凯浠ｆ寚閽堢Щ鍒扮涓�浣�
		iter = list.iterator();
		while (iter.hasNext()) {
			tempMethod = iter.next();
			sql += tempMethod.getName().substring(3).toLowerCase() + "= ?,";
		}
		// 把迭代指针移到第一位
		sql = sql.substring(0, sql.lastIndexOf(","));
		// 去掉最后一个,符号
		sql += " where " + idMethod.getName().substring(3).toLowerCase() + " = ?";
		// SQL拼接完成,打印SQL语句
		System.out.println(sql);
		iter = list.iterator();
		StringBuffer sf = new StringBuffer();
		while (iter.hasNext()) {
			Method method = iter.next();
			// 初判断返回值的类型,因为存入数据库时有的字段值格式需要改变,比如String,SQL语句是'"+abc+"
			if (method.getReturnType().getSimpleName().indexOf("String") != -1) {
				sf.append(this.getString(method, entity) + "&");
			} else {
				sf.append(this.getInt(method, entity) + "&");
			}
		}

		// 为Id字段添加值
		if (idMethod.getReturnType().getSimpleName().indexOf("String") != -1) {
			sf.append(this.getString(idMethod, entity));
		} else {
			sf.append(this.getInt(idMethod, entity));
		}
		Object[] values = sf.toString().split("&");
		if (jdbcTemplate.update(sql, values) > 0) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public boolean delete(T entity) throws Exception {
		boolean flag = false;
		String sql = "delete from " + entity.getClass().getSimpleName().toLowerCase() + " where ";
		Method[] methods = entity.getClass().getDeclaredMethods();
		Method getIdMethod = null;
		for (Method method : methods) {
			if (method.getName().startsWith("get")) {
				if (method.getName().toLowerCase().indexOf("id") != -1) {
					getIdMethod = method;
					break;
				}
			}
		}
		String entityId = null;
		if (getIdMethod != null) {
			entityId = getIdMethod.getName().substring(3);
		}
		sql += entityId + "=?";
		StringBuffer sf = new StringBuffer();
		if (getIdMethod.getReturnType().getName().contains("String")) {
			sf.append(getString(getIdMethod, entity));
		} else {
			System.out.println(this.getInt(getIdMethod, entity));
			sf.append(getInt(getIdMethod, entity));
		}
		Object[] values = sf.toString().split(",");
		if (jdbcTemplate.update(sql, values) > 0) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public boolean save(T entity) throws Exception {
		boolean flag = false;
		String id = "";
		String sql = "insert into " + entity.getClass().getSimpleName().toLowerCase() + "(";
		List<Method> list = new ArrayList<Method>();
		Method[] methods = entity.getClass().getDeclaredMethods();
		for (Method m : methods) {
			if (m.getName().indexOf("get") != -1) {
				list.add(m);
			}
		}
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getName().toLowerCase().indexOf("id") != -1) {

				id = list.get(i).getName().substring(3).toLowerCase();
				if (id.contains(entity.getClass().getSimpleName().toLowerCase())) {
					list.remove(i);
					// sql+=id+，
					break;
				}
			}
		}
		for (int i = 0; i < list.size(); i++) {
			sql += list.get(i).getName().substring(3).toLowerCase() + ",";
		}
		sql = sql.substring(0, sql.lastIndexOf(",")) + ") values(";
		for (int i = 0; i < list.size(); i++) {
			sql += "?,";
		}
		sql = sql.substring(0, sql.lastIndexOf(",")) + ")";
		System.out.println(sql);
		StringBuffer sf = new StringBuffer();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getReturnType().getName().indexOf("String") != -1) {
				String value = this.getString(list.get(i), entity);
				sf.append(value + "&");
				System.out.println(i + "\\" + value + "\\" + list.get(i).getName());
			} else if (list.get(i).getReturnType().getName().indexOf("int") != -1) {
				int intvalue = this.getInt(list.get(i), entity);
				sf.append(intvalue + "&");
				System.out.println(i + "\\" + intvalue + "\\" + list.get(i).getName());
			}
		}
		Object[] values = sf.toString().split("&");
		if (jdbcTemplate.update(sql, values) > 0) {
			flag = true;
		}
		return flag;

	}

	/**
	 * 
	 * @param tuser瀵硅薄
	 * @return 
	 */
	public List<Map<String, Object>> login(Tuser tuser) {
		String sql = "select * from tuser t1,tright t2,tuserrightrelation t3 where t1.tuserid=t3.tuserid and t2.trightid=t3.trightid and username='"
				+ tuser.getUsername() + "' and password='" + tuser.getPassword() + "'";

		return jdbcTemplate.queryForList(sql);

	}

	/**
	 * 
	 * @param rname
	 *          重命名
	 * @return 
	 */
	public List<Map<String, Object>> queryMenu(String rname) {
		String sql = "SELECT zname,cname,m.menuID,m.pid,url FROM(SELECT z.mname zname,c.mname cname,z.menuID,c.pid,c.url FROM menu z,menu c WHERE z.menuID = c.pid) m,tright t,menurightrelation r WHERE m.menuID = r.menuID AND r.rname = t.rname AND t.rname = '"
				+ rname + "' group by url";
		return jdbcTemplate.queryForList(sql);
	}

	/**
	 * 
	 * @param currPage
	 *           当前页
	 * @param pageSize
	 *            页码数
	 * @param action
	 *            操作
	 * @return PageModel
	 */
	public PageModel queryTuser(int currPage, int pageSize, String action) {
		String sql = "SELECT t1.*, t2.* FROM tuser t1,tright t2,tuserrightrelation t3 WHERE t1.tuserid = t3.tuserid AND t2.trightid = t3.trightid AND t2.rname = '"
				+ action + "' ORDER BY	t1.tuserID LIMIT " + (currPage - 1) * pageSize + ", " + pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "SELECT count(*) FROM tuser t1,tright t2,tuserrightrelation t3 WHERE t1.tuserid = t3.tuserid AND t2.trightid = t3.trightid AND t2.rname = '"
				+ action + "'";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * 
	 * @param id
	 * @param tableName
	 * @param tableId
	 * @return 
	 */
	public boolean deleteById(String id, String tableName) {
		String tableId = tableName + "id";
		String sql = "delete from " + tableName + " where " + tableId + " =" + id + " ";
		if (jdbcTemplate.update(sql) > 0) {
			return true;
		}
		return false;

	}

	/**
	 * 
	 * @param tuserid
	 * @param trightid
	 * @return 
	 */
	public boolean changeTright(String tuserid, String trightid) {
		String sql = "update TUSERRIGHTRELATION set trightid=" + trightid + " where tuserid=" + tuserid + "";
		if (jdbcTemplate.update(sql) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 
	 * @param tablename
	 * @return 
	 */
	public List<Map<String, Object>> queryAll(String tablename) {
		String sql = "select * from " + tablename + "";
		return jdbcTemplate.queryForList(sql);
	}

	/**
	 * @return
	 */
	public List<Map<String, Object>> queryTuserAndTright() {
		String sql = "SELECT * from tuser t1,tright t2,tuserrightrelation t3 where t1.tuserID=t3.tuserID and t2.trightID=t3.trightID";
		return jdbcTemplate.queryForList(sql);
	}

	/**
	 * 
	 * @param tuserid
	 * @return 
	 */
	public List<Map<String, Object>> querySingle(String tuserid) {
		String sql = "SELECT * from tuser t1,tright t2,tuserrightrelation t3 WHERE t1.tuserID=t3.tuserID and t2.trightID=t3.trightID and t1.tuserID="
				+ tuserid + ";";
		return jdbcTemplate.queryForList(sql);
	}

	/**
	 * 
	 * @param tablename
	 *           
	 * @param field
	 *           
	 * @param valuename
	 *           
	 * @return 
	 */
	public boolean checkName(String tablename, String field, String valuename) {
		String sql = "SELECT COUNT(*) from " + tablename + " where " + field + "='" + valuename + "' ";
		if (jdbcTemplate.queryForObject(sql, Integer.class) == 0) {
			return true;
		}
		return false;
	}

	/**
	 * 
	 * @param currPage
	 *           当前页
	 * @param pageSize
	 *            页面大小
	 * @param action
	 *           操作
	 * @return PageModel 页面模式
	 *         value 
	 */
	public PageModel queryTright(int currPage, int pageSize, String action) {
		String sql = " select z.rname zname,z.description zdp,c.* from tright z,tright c where z.trightid=c.pid and c.rname='"
				+ action + "' ORDER BY c.trightID LIMIT " + (currPage - 1) * pageSize + "," + pageSize + ";";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		for (Map<String, Object> map : list) {
			// map.get("zname").equals("boss")
			switch ((String) map.get("zname")) {
			case "boss":
				map.put("zname", "鐞冮槦缁忕悊");
				break;
			case "staff":
				map.put("zname", "骞蹭簨缁�");
				break;
			case "player":
				map.put("zname", "鐞冨憳缁�");
				break;
			}
			switch ((String) map.get("rname")) {
			case "boss":
				map.put("rname", "鐞冮槦缁忕悊");
				break;
			case "staff":
				map.put("rname", "骞蹭簨缁�");
				break;
			case "player":
				map.put("rname", "鐞冨憳缁�");
				break;
			case "coach":
				map.put("rname", "鏁欑粌缁�");
				break;
			}
		}
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "select count(*) from tright z,tright c where z.trightid=c.pid and c.rname='" + action + "'";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @param currPage
	 * @param pageSize
	 * @param mark
	 *            
	 * @param tuserid
	 * @return 
	 */
	public PageModel queryMemo(int currPage, int pageSize, String mark, String tuserid) {
		String sql = "SELECT * FROM  memo where tuserid = " + tuserid + " and mark ='" + mark
				+ "' ORDER BY memoid  LIMIT " + (currPage - 1) * pageSize + ", " + pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "SELECT count(*) FROM  memo where tuserid = " + tuserid + " and mark ='" + mark + "'";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @param playid
	 * @return
	 */
	public List<Map<String, Object>> queryCommentsCoach(String playid) {
		String sql = "select t1.*,t2.* from tuser t1, tright t2,tuserrightrelation t3 where t1.tuserid=t3.tuserid and t2.trightid=t3.trightid and t2.rname ='coach'";
		List<Map<String, Object>> commentsCoachList = jdbcTemplate.queryForList(sql);
		String sql2 = "SELECT t1.tuserID FROM tuser t1,tright t2,tuserrightrelation t3,comments t4 WHERE	t1.tuserid = t3.tuserid AND t2.trightid = t3.trightid AND t4.tuserid = t1.tuserid AND t4.playerid = "
				+ playid + "";
		List<Map<String, Object>> List = jdbcTemplate.queryForList(sql2);
		for (Map<String, Object> map : List) {
			for (int i = 0; i < commentsCoachList.size(); i++) {
				if (map.get("tuserID") == commentsCoachList.get(i).get("tuserID")) {
					commentsCoachList.remove(i--);
				}
			}
		}
		return commentsCoachList;
	}

	/**
	 * @param currPage
	 * @param pageSize
	 * @return 
	 */
	public PageModel queryCommentsCoach(int currPage, int pageSize) {
		String sql = "select * from tuser t1, tright t2,tuserrightrelation t3,comments t4 where t1.tuserid=t3.tuserid and t2.trightid=t3.trightid and t1.tuserid=t4.tuserid   ORDER BY t4.tuserID LIMIT  "
				+ (currPage - 1) * pageSize + ", " + pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "select count(*) from tuser t1, tright t2,tuserrightrelation t3,comments t4 where t1.tuserid=t3.tuserid and t2.trightid=t3.trightid and t1.tuserid=t4.tuserid  ";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @param currPage
	 * @param pageSize
	 *            Show querySummary
	 */
	public PageModel querySummary(int currPage, int pageSize) {
		String sql = "SELECT * from summary ORDER BY summaryid  LIMIT " + (currPage - 1) * pageSize + ", " + pageSize
				+ "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "SELECT count(*) from summary";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @param currPage
	 * @param pageSize
	 *            queryFormation
	 */
	public PageModel queryFormation(int currPage, int pageSize) {
		String sql = "SELECT * from formation ORDER BY formationid  LIMIT " + (currPage - 1) * pageSize + ", "
				+ pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "SELECT count(*) from formation";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @return 
	 */
	public boolean cleanStatus(String tableName) {
		String sql = "UPDATE " + tableName + " SET `status` ='鏈惎鐢�'";
		if (jdbcTemplate.update(sql) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * @param currPage
	 * @param pageSize
	 * @return 
	 */
	public PageModel queryTrain(int currPage, int pageSize) {
		String sql = "SELECT t2.description,t1.realname,t4.* from train t4 LEFT JOIN tuser t1 ON t4.tuserid=t1.tuserid LEFT JOIN tuserrightrelation t3 ON t3.tuserid=t1.tuserid LEFT JOIN tright t2 ON t2.trightid=t3.trightid ORDER BY t4.trainid DESC LIMIT "
				+ (currPage - 1) * pageSize + ", " + pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "SELECT count(*) from train t4 LEFT JOIN tuser t1 ON t4.tuserid=t1.tuserid LEFT JOIN tuserrightrelation t3 ON t3.tuserid=t1.tuserid LEFT JOIN tright t2 ON t2.trightid=t3.trightid";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @return 
	 */
	public List<Map<String, Object>> queryPlayerAll() {
		String sql = "SELECT * from tuser t1,tright t2,tuserrightrelation t3 where t1.tuserID=t3.tuserID and t2.trightID=t3.trightID and t2.rname='player'";
		return jdbcTemplate.queryForList(sql);
	}

	/**
	 * @param currPage
	 * @param pageSize
	 * @return count(distinct tuserid) + group by tuserid 
	 *         by dataid desc 
	 * 
	 *         SELECT t2.description,t1.realname,count(DISTINCT
	 *         t4.tuserid),t4.dataid,t4.tuserid,ROUND(avg(t4.minutes*1.1),1)
	 *         minutes,ROUND(avg(t4.assists),1) assists,ROUND(avg(t4.goals),1)
	 *         goals,ROUND(avg(t4.tackles),1) tackles,ROUND(avg(t4.clear),1)
	 *         clear,ROUND(avg(t4.fouls),1) fouls,ROUND(avg(t4.pass),1) pass
	 *         from data t4 LEFT JOIN tuser t1 ON t4.tuserid=t1.tuserid LEFT
	 *         JOIN tuserrightrelation t3 ON t3.tuserid=t1.tuserid LEFT JOIN
	 *         tright t2 ON t2.trightid=t3.trightid GROUP BY t4.tuserid
	 */
	public PageModel queryData(int currPage, int pageSize) {
		String sql = "SELECT t2.description,t1.realname,t4.* from (SELECT * from data ORDER BY dataid desc) t4 LEFT JOIN tuser t1 ON t4.tuserid=t1.tuserid LEFT JOIN tuserrightrelation t3 ON t3.tuserid=t1.tuserid LEFT JOIN tright t2 ON t2.trightid=t3.trightid GROUP BY t4.tuserid ORDER BY dataid desc LIMIT "
				+ (currPage - 1) * pageSize + ", " + pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "SELECT  count(DISTINCT tuserid) FROM data ";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	/**
	 * @param tuserid
	 * @return 
	 */
	public DataUtil querySingleData(String tuserid) {
		String sql = "SELECT * FROM data WHERE tuserid=" + tuserid + " ORDER BY dataid desc LIMIT 0,7";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		DataUtil dataUtil = new DataUtil();
		ArrayList<Object> minutesList = new ArrayList<>();
		ArrayList<Object> goalsList = new ArrayList<>();
		ArrayList<Object> assistsList = new ArrayList<>();
		ArrayList<Object> tacklesList = new ArrayList<>();
		ArrayList<Object> clearList = new ArrayList<>();
		ArrayList<Object> foulsList = new ArrayList<>();
		ArrayList<Object> passList = new ArrayList<>();
		for (Map<String, Object> map : list) {
			minutesList.add(map.get("minutes"));
			goalsList.add(map.get("goals"));
			assistsList.add(map.get("assists"));
			tacklesList.add(map.get("tackles"));
			clearList.add(map.get("clear"));
			foulsList.add(map.get("fouls"));
			passList.add(map.get("pass"));
		}
		dataUtil.setMinutes(minutesList.toArray());
		dataUtil.setGoals(goalsList.toArray());
		dataUtil.setAssists(assistsList.toArray());
		dataUtil.setTackles(tacklesList.toArray());
		dataUtil.setClear(clearList.toArray());
		dataUtil.setFouls(foulsList.toArray());
		dataUtil.setPass(passList.toArray());

		return dataUtil;
	}

	/**
	 * @param coachid
	 * @return
	 */
	public List<Map<String, Object>> queryAssessPlayer(String coachid) {
		String sql = "select t1.*,t2.* from tuser t1, tright t2,tuserrightrelation t3 where t1.tuserid=t3.tuserid and t2.trightid=t3.trightid and t2.rname ='player'";
		List<Map<String, Object>> assessPlayerList = jdbcTemplate.queryForList(sql);
		String sql2 = "SELECT t1.tuserID FROM tuser t1,tright t2,tuserrightrelation t3,assessment t4 WHERE	t1.tuserid = t3.tuserid AND t2.trightid = t3.trightid AND t4.tuserid = t1.tuserid AND t4.coachid = "
				+ coachid + "";
		List<Map<String, Object>> List = jdbcTemplate.queryForList(sql2);
		for (Map<String, Object> map : List) {
			for (int i = 0; i < assessPlayerList.size(); i++) {
				if (map.get("tuserID") == assessPlayerList.get(i).get("tuserID")) {
					assessPlayerList.remove(i--);
				}
			}
		}
		return assessPlayerList;
	}

	/**
	 * @param currPage
	 * @param pageSize
	 * @return 
	 */
	public PageModel queryMenuList(int currPage, int pageSize) {
		String sql = "select * from menu ORDER BY menuid  LIMIT " + (currPage - 1) * pageSize + ", " + pageSize + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		PageModel pageModel = new PageModel();
		pageModel.setCurrPage(currPage);
		pageModel.setList(list);
		pageModel.setPageSize(pageSize);
		String sql2 = "select count(*) from menu";
		pageModel.setTotalRecords(jdbcTemplate.queryForObject(sql2, Integer.class));
		return pageModel;
	}

	public MenuUtil showMenuTright() {
		String sql = "SELECT * from menurightrelation m where m.menuid=6 OR m.menuid=9";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		MenuUtil m = new MenuUtil();
		for (Map<String, Object> map : list) {
			if (("6").equals(map.get("menuid").toString())) {
				switch (map.get("rname").toString()) {
				case "staff":
					m.setCommentsstaff(true);
					break;
				case "coach":
					m.setCommentscoach(true);
					break;
				case "player":
					m.setCommentsplayer(true);
					break;
				default:
					break;
				}
			}
			if (("9").equals(map.get("menuid").toString())) {
				switch (map.get("rname").toString()) {
				case "staff":
					m.setAssessmentstaff(true);
					break;
				case "coach":
					m.setAssessmentcoach(true);
					break;
				case "player":
					m.setAssessmentplayer(true);
					break;
				default:
					break;
				}
			}
		}
		return m;
	}

	public boolean edtMenuTrightAll(String[] assessment, String[] comments) {
		String sql = "update  menurightrelation SET rname='stop' WHERE menurightrelationid IN (61,62,63,91,92,93)";
		if (jdbcTemplate.update(sql) > 0) {
			for (String string : assessment) {
				switch (string) {
				case "assessmentstaff":
					String sql1 = "update menurightrelation set rname='staff' where menurightrelationid=91 ";
					jdbcTemplate.update(sql1);
					break;
				case "assessmentcoach":
					String sql2 = "update menurightrelation set rname='coach' where menurightrelationid=92 ";
					jdbcTemplate.update(sql2);
					break;
				case "assessmentplayer":
					String sql3 = "update menurightrelation set rname='player' where menurightrelationid=93";
					jdbcTemplate.update(sql3);
					break;
				}
			}
			for (String string : comments) {
				switch (string) {
				case "commentsstaff":
					String sql1 = "update menurightrelation set rname='staff' where menurightrelationid=61 ";
					jdbcTemplate.update(sql1);
					break;
				case "commentscoach":
					String sql2 = "update menurightrelation set rname='coach' where menurightrelationid=62 ";
					jdbcTemplate.update(sql2);
					break;
				case "commentsplayer":
					String sql3 = "update menurightrelation set rname='player' where menurightrelationid=63";
					jdbcTemplate.update(sql3);
					break;
				}
			}
			return true;
		}
		return false;
	}

}