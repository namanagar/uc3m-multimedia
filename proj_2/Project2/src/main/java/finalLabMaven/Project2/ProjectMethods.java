package finalLabMaven.Project2;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ProjectMethods {
	
	public static final String URL_WIKIE = "https://www.imdb.com/title/tt0010071/";
	
	public static void getTitle(String url) throws IOException{ // works
		Document doc = Jsoup.connect(url).get();
		System.out.println(url + ":\t" + doc.title());
	}
	
	public static void getHRef(String url) throws IOException{
		Document doc = Jsoup.connect(url).get();
		System.out.println("a href from:\t" + doc.title());
		Elements lst = doc.select("a[href]");
		
		for (Element elem:lst) {
			System.out.println("\t:" + elem.text());
		}
	}
	
	public static void getYear(String url) throws IOException{
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("a[href]");
		
		System.out.println("\t:" + lst.get(84).text());
	}
	
	
	public static void getH4(String url) throws IOException{
		Document doc = Jsoup.connect(url).get();
		System.out.println("H4 from:\t" + doc.title());
		
		Elements lst = doc.select("h4");
		for(Element elem:lst) {
			System.out.println("\t:" + elem.childNode(0).toString());
		}
	}
	
	public static void getSummary(String url) throws IOException{ // summary, works
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("div.summary_text");
		
		for (Element elem:lst) {
			System.out.println("\t:" + elem.text());
		}
	}
	
	public static void getDirector(String url) throws IOException{ // works
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("div.credit_summary_item"); //first one for director
		
		System.out.println(lst.get(0).text());
	}
	
	public static void getKeywords(String url) throws IOException{ // works
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("div.see-more.inline.canwrap");
		
		System.out.println("\t:" + lst.get(0).text());
	}
	
	public static void getGenres(String url) throws IOException{ // works
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("div.see-more.inline.canwrap");
		
		System.out.println(lst.get(1).text());
	}
	
	public static void getStoryline(String url) throws IOException{ // works
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("div.inline.canwrap");
	
		System.out.println("\t:" + lst.get(0).text());
	}
	
	public static void getCountry(String url) throws IOException{ // summary, works
		Document doc = Jsoup.connect(url).get();
		Elements lst = doc.select("div.txt-block");
		
		System.out.println(lst.get(3).text());
	}
	
	public static void main(String[] args) throws Exception {
		BufferedReader in = new BufferedReader(new FileReader("/Users/justinspar/Desktop/uc3m-multimedia/proj_2/Project2/src/main/java/finalLabMaven/Project2/movies.txt"));
		
		String line;
		
		while((line = in.readLine()) != null)
		{
		   getTitle(line);
		   getDirector(line);
		   getSummary(line);
		   getStoryline(line);
		   getKeywords(line);
		   getGenres(line);
		   getYear(line);
		   getCountry(line);
		   System.out.println();
		}
	}
}
