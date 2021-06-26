package com.ssm.component.common.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/common")
public class CommonDispatcher {
	@RequestMapping("/{path}/{view}")
	public String dispatcher(@PathVariable String path, @PathVariable String view) {
		return path + "/" + view;
	}
}
