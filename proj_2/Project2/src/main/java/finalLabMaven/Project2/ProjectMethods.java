package finalLabMaven.Project2;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ProjectMethods {
	
	public static final String URL_WIKIE = "https://www.imdb.com/title/tt0111161";
	
	public static void getTitle(String url) throws IOException{
		Document doc = Jsoup.connect(url).get();
		System.out.println(url + ":\t" + doc.title());
		System.out.println();
	}
	
	public static void getHRef(String url) throws IOException{
		Document doc = Jsoup.connect(url).get();
		System.out.println("a href from:\t" + doc.title());
		Elements lst = doc.select("a[href]");
		
		for (Element elem:lst) {
			System.out.println("\t:" + elem.text());
		}
		
		System.out.println();
	}
	
	public static void main(String[] args) throws IOException {
		getTitle(URL_WIKIE);
		getHRef(URL_WIKIE);
	}

}
