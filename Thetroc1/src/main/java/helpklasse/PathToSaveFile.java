package helpklasse;

public class PathToSaveFile {
	private static String Path = "C:\\apache-tomcat-9.0.56\\webapps\\Thetroc1\\Dateien\\";
	//private static String Path ="C:\\Users\\user\\git\\thetroc\\Thetroc1\\src\\main\\webapp\\Dateien\\";
	private static String osDivider = "\\";
	public static String getPathToSaveFile() {
		return Path;
	}
	public static String getOsDivider() {
		return osDivider;
	}
}
