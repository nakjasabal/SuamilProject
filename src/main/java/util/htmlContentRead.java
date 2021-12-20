package util;

import java.io.BufferedReader;
import java.io.FileReader;

import javax.servlet.ServletContext;

public class htmlContentRead 
{
	public String htmlRead(ServletContext application, String dir, String fName)
	{
		String dirPath = "";
		String filePath = "";	
		String sLine="";
		String mainContent="";	
		try{
			dirPath = application.getRealPath(dir);//디렉토리명
			filePath = dirPath + fName;//파일명
		
			//파일읽기
			FileReader fr = new FileReader(filePath);//읽기객체생성.
			BufferedReader br = new BufferedReader(fr);//버퍼객체생성.
		
			//버퍼객체에들어간파일을라인단위로읽어내기
			while((sLine=br.readLine())!=null) 
			{
				mainContent = mainContent + sLine + "\n";
			}		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return mainContent;
	}
}
