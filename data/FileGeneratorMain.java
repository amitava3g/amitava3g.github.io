import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class FileGeneratorMain {

	public static void main(String[] args) {
		String templatePath = "/Users/Documents/site/amitava3g.github.io/";
		String processor = "/Users/eclipse-workspace/test/src/FileGeneratorMain.java";
		String recipes_data = "";
		// For cities
		try {
			String recipes_template = templatePath + "data/cities.html";
			File fXmlFile = new File(templatePath + "data/picdata-city.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);

			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("element");

			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					recipes_data = recepiData(recipes_data, eElement);
				}
			}
			String fileData = readFile(recipes_template);
			fileData = fileData.replace("##DATA_ENTRY##", recipes_data);
			saveFile(templatePath + "cities.html", fileData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//For Nature
		recipes_data = "";
		try {
			String recipes_template = templatePath + "data/nature.html";
			File fXmlFile = new File(templatePath + "data/picdata-nature.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);

			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("element");

			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					recipes_data = recepiData(recipes_data, eElement);
				}
			}
			String fileData = readFile(recipes_template);
			fileData = fileData.replace("##DATA_ENTRY##", recipes_data);
			saveFile(templatePath + "nature.html", fileData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		selfCopy(templatePath + "data/FileGeneratorMain.java", processor);
		System.out.println("Processed ...");
	}

	public static String recepiData(String recipes_data, Element eElement) {
		recipes_data += "<div><a class=\"group1\" href='" + eElement.getElementsByTagName("pic").item(0).getTextContent() + "' title='" + eElement.getElementsByTagName("copy").item(0).getTextContent() + "'><img src='" + eElement.getElementsByTagName("thumb").item(0).getTextContent() + "'/></a></div>";
		return recipes_data;
	}

	public static String readFile(String fileName) {
		String line = null;
		String fileData = "";
		try {
			// FileReader reads text files in the default encoding.
			FileReader fileReader = new FileReader(fileName);

			// Always wrap FileReader in BufferedReader.
			BufferedReader bufferedReader = new BufferedReader(fileReader);

			while ((line = bufferedReader.readLine()) != null) {
				fileData += line;
			}

			// Always close files.
			bufferedReader.close();
		} catch (FileNotFoundException ex) {
			System.out.println("Unable to open file '" + fileName + "'");
		} catch (IOException ex) {
			System.out.println("Error reading file '" + fileName + "'");
		}
		return fileData;
	}

	public static void saveFile(String outPath, String fileData) {
		try {
			File newTextFile = new File(outPath);
			FileWriter fw = new FileWriter(newTextFile);
			fw.write(fileData);
			fw.close();
		} catch (IOException iox) {
			iox.printStackTrace();
		}
	}

	public static void selfCopy(String dest, String processor) {
		File srcf = new File(processor);
		File destf = new File(dest);
		destf.delete();
		try {
			Files.copy(srcf.toPath(), destf.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
