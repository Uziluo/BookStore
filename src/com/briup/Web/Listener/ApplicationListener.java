package com.briup.Web.Listener;

import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.briup.Bean.Category;
import com.briup.Bean.PriceRank;
import com.briup.Bean.Publish;
import com.briup.Service.CategoryService;
import com.briup.Service.PeiceRankService;
import com.briup.Service.PublishService;


/**
 * 
 * 从数据库中加载基本产品信息
 * @author Gress
 *
 */
@WebListener
public class ApplicationListener implements ServletContextListener {
	private static CategoryService cService  = new CategoryService();
	private static PublishService pServise = new PublishService();
	private static PeiceRankService prService = new PeiceRankService();
    public void contextDestroyed(ServletContextEvent sce)  { 
    }
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("这里监控Application 的生产");
    	ServletContext application =  sce.getServletContext();
    	sce.getServletContext();
    	List<Category> list = cService.selectAll();
    	Set<Publish> publishs = pServise.selectAllPulish();
    	List<PriceRank> rank = prService.selectAllRank();
    	application.setAttribute("clist", list);
    	application.setAttribute("cpublish", publishs);
    	application.setAttribute("crank", rank);
    }
}
