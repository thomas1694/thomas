package spring.sts.pmw;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.statistics.StaticDAO;

@Controller
public class ChartController {
	
	@Autowired
	private StaticDAO stdao;
	
	
    @RequestMapping("/chart")
    public ModelAndView chart(HttpServletRequest request) {
    	String s_id=(String)request.getSession().getAttribute("id");
    	Map map=new HashMap<>();
    	map.put("s_id",s_id);
    	int visitcount[]=new int[7];
    	for(int i=0;i<7;i++) {
    	map.put("dt", i);	
    	visitcount[i]=stdao.countread(map);
    	System.out.println(visitcount[i]);
    	}
    	int m=0;
    	int w=0;
    	Map map2=new HashMap<>();
    	map2.put("s_id", s_id);
    	map2.put("gender", "m");
    	m=stdao.countgender(map2);
    	map2.remove("gender");
    	map2.put("gender", "w");
    	w=stdao.countgender(map2);
    	
        String path = request.getRealPath("/storage/chart");
        ModelAndView view = new ModelAndView();
        RConnection connection = null;
        try {
            connection = new RConnection();
            connection.eval("library(devtools)");
            connection.eval("library(RCurl)");
            connection.eval("library(d3Network)");
            connection.eval("library(ggplot2)");
            connection.eval("library(gridExtra)");
            connection.eval("성별<-c(\"남자\",\"여자\")");
            connection.eval("방문자수<-c("+m+","+w+")");
            connection.eval("df<-data.frame(성별,방문자수)");
            connection.eval("p1<-ggplot(data=df,aes(x=성별,y=방문자수))+geom_col()");
            connection.eval("날짜<-c(-6,-5,-4,-3,-2,-1,0)");
            connection.eval("날짜별방문자수<-c("+visitcount[6]+","
            		+visitcount[5]+","
            		+visitcount[4]+","
            		+visitcount[3]+","
            		+visitcount[2]+","
            		+visitcount[1]+","
            		+visitcount[0]+")");
            connection.eval("df2<-data.frame(날짜,날짜별방문자수)");
            connection.eval("g1<-ggplot(df2,aes(x=날짜,y=날짜별방문자수,group=1))");
            connection.eval("p2<-g1+geom_point(size=2)+geom_line(size=1)");
            connection.eval("ggsave(file='D:/opensource/ojt/chart/a.jpg',p1)");
            connection.eval("ggsave(file='D:/opensource/ojt/chart/b.jpg',p2)");
            connection.close();
           
            File jpeg=new File("D:/opensource/ojt/chart/a.jpg");
            byte[] bytes=new byte[(int)jpeg.length()];
            DataInputStream in1=new DataInputStream(new FileInputStream(jpeg));
            in1.readFully(bytes);
            in1.close();
            FileOutputStream out1=new FileOutputStream(path +"/"+s_id+"1.jpg");
            out1.write(bytes);
            out1.close();
            
            File jpeg2=new File("D:/opensource/ojt/chart/b.jpg");
            byte[] bytes2=new byte[(int)jpeg2.length()];
            DataInputStream in2=new DataInputStream(new FileInputStream(jpeg2));
            in2.readFully(bytes2);
            in2.close();
            FileOutputStream out2=new FileOutputStream(path +"/"+s_id+"2.jpg");
            out2.write(bytes2);
            out2.close();
            
            view.setViewName("/chart");
            
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }
        return view;
    }
}

