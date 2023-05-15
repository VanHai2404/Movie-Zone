package commom;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class UploatUtils {
	public static String processUploatField(String fialName, HttpServletRequest request, String storedFolder,
			String storeFileName) throws IOException, ServletException {

		Part filePart = request.getPart(fialName);

		if (filePart == null || filePart.getSize() == 0) {
			return "";
		}
		if (storedFolder == null) {
			storedFolder = "/";

		}
		if (storeFileName == null) {
			storeFileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

		} else {
			storeFileName += "." + FilenameUtils.getExtension(Path.of(filePart.getSubmittedFileName()).toString());

		}

		String uploatFolder = request.getServletContext().getRealPath(storedFolder);
		Path uploadPath = Paths.get(uploatFolder);

		if (!Files.exists(uploadPath)) {
			Files.createDirectory(uploadPath);
		}
		filePart.write(Paths.get(uploadPath.toString(), storeFileName).toString());

		return storeFileName;

	}

}
