package com.gzm.xm.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gzm.xm.common.entity.User;
import com.octo.captcha.service.image.ImageCaptchaService;

@Controller
public class IndexController extends AbstractContoller {

    @Autowired
    @Qualifier("imageCaptchaService")
    private ImageCaptchaService imageCaptchaService;

    /*
    @RequestMapping(value = "/back/index",method = RequestMethod.GET)
    public String goBackIndex() {
       return "admin/backend";
    }
    
    
    @RequestMapping(value = "/login",method =RequestMethod.GET)
	public String toLogin(HttpServletRequest request,
                          @RequestParam( required = false )Boolean error, ModelMap map ){
		if(error != null && error) {
            map.put("error","error");
        }
		
		return "login/login";
	}
	
	
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String login(User user, HttpServletRequest request, ModelMap map){
        User found = loginService.exitUser(user);
        if(found == null) {
            map.put("error","not exit user");
            return "redirect:/backend/login";
        } else{
        	request.getSession().setAttribute("uid", found.getId());
        	return "redirect:/backend/back/index";
        }
	}
    
	/*@RequestMapping(value = "/login",method =RequestMethod.GET)
	public String toLogin(HttpServletRequest request,
                          @RequestParam( required = false )Boolean error, ModelMap map ){
		if(error != null && error) {
            map.put("error","error");
        }
		
		return "login/login";
	}
	
	
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String login(User user, HttpServletRequest request,
                        HttpSession session,@RequestParam String captcha,
                        ModelMap map){
        boolean isResponseCorrect;
        String captchaId = request.getSession().getId();
        isResponseCorrect = imageCaptchaService.validateResponseForID(captchaId,captcha);
        if(!isResponseCorrect){
            map.put("error","captcha error");
            return "login/login";
        }
        User found = loginService.exitUser(user);

        if(found == null) {
            map.put("error","not exit user");
            return "logon/login";
        } else {
            session.putValue("user",found);
            return "welcome";
        }
	}

    @RequestMapping(value = "/check",method = RequestMethod.POST)
    public int check(@RequestParam String name) {
       User found = loginService.check(name);
       if(found == null){
           return 1;
       }
       return 0;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@RequestParam String username,@RequestParam String password) {

      return "welcome";
    }

    @RequestMapping(value = "/captcha",method = RequestMethod.GET)
    public void captcha(HttpServletRequest request,HttpServletResponse response) throws Exception{
        byte[] captchaChallengeAsJpeg;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try{
            String captchaId = request.getSession().getId();
            BufferedImage challenge = imageCaptchaService.getImageChallengeForID(captchaId,request.getLocale());
            ImageIO.write(challenge, CAPTCHA_IMAGE_FORMAT, jpegOutputStream);
        } catch (IOException e) {
            //TODO log
        }
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();

        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/"+CAPTCHA_IMAGE_FORMAT);

        ServletOutputStream responseOutputStream = response.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }*/

}
