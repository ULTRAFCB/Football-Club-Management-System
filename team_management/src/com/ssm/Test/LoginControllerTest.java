package com.ssm.Test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssm.component.data.service.impl.DataService;
import com.ssm.component.login.controller.LoginController;
import com.ssm.entity.Tuser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:com/ssm/config/spring-applicationContext.xml" })
public class LoginControllerTest {
	@Autowired
	private LoginController LoginController;
	@Autowired
	private DataService d;

	@Test
	public void test() {
		Tuser tuser = new Tuser();
		tuser.setTuserID(101);
		tuser.setPassword("132213123123123123");
		tuser.setUsername("qwe213qwe");

		try {
			// System.out.println(LoginController.edtUser(tuser,null, null));
			// LoginService.;
			// System.out.println(TuserService.deleteTuser("103","tuser"));
			// CommonService.changeTrightByid("17", "100");
			// TuserService.queryTright(0, 5, "staff");
			// System.out.println();

			System.out.println(d.showMenuTright());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public LoginController getLoginController() {
		return LoginController;
	}

	public void setLoginController(LoginController loginController) {
		LoginController = loginController;
	}

	public static void main(String[] args) {
		System.out.println(1);
	}
}
