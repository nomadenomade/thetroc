package helpklasse;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.datamatrix.DataMatrixReader;
import com.google.zxing.qrcode.QRCodeWriter;

import Model.Verkaufer;


public class QRcode {

	
	public static BufferedImage getImage (String textcode){
		QRCodeWriter codewriter = new QRCodeWriter();
		BitMatrix matix=null;
		try {
			matix = codewriter.encode(textcode, BarcodeFormat.QR_CODE, 300, 300);
			
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return MatrixToImageWriter.toBufferedImage(matix);
	}
	
	public static void saveQRcode(String textcode,String email) {
		File outimage = new File(PathToSaveFile.getPathToSaveFile()+email+"\\QRcode.jpg");
		try {
			
			ImageIO.write(getImage(textcode), "jpg", outimage);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static String readQRcode(String email) {
		String source = PathToSaveFile.getPathToSaveFile()+email+PathToSaveFile.getOsDivider()+"QRcode.jpg";
		String decodedtext=null;
		try {
			BinaryBitmap binarybitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(new FileInputStream(source)))));
			try {
				Result result = new MultiFormatReader().decode(binarybitmap);
				decodedtext = result.getText();
				
			} catch (NotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return decodedtext;
	}
	
	public static String getBarcode(Verkaufer verkaufer) {
		String result="";
		Random rand = new Random();
		int position = rand.nextInt(3);
		int codeint = rand.nextInt(10000);
		String first2letter = verkaufer.getPerson().getName().substring(0, 2);
		String second2letter = verkaufer.getPerson().getEmail().substring(0, 2);
		String idfirstnumber = String.valueOf(verkaufer.getIdVerkaufer());
		
		if(idfirstnumber.length()>3) {
			idfirstnumber=idfirstnumber.substring(0, 3);
		}
		
		if(position==0) {
			result = first2letter.toUpperCase()+String.valueOf(codeint)+"-"+idfirstnumber+"-"+String.valueOf(codeint)+second2letter.toUpperCase();
		}else if(position==1){
			result = String.valueOf(codeint)+first2letter.toUpperCase()+"-"+second2letter.toUpperCase()+idfirstnumber+"-"+String.valueOf(codeint);
		}else if(position == 2) {
			result = idfirstnumber+"-"+String.valueOf(codeint)+first2letter.toUpperCase()+"-"+second2letter.toUpperCase()+"-"+String.valueOf(codeint);
		}
		 //
		
		
		return result;
	}

}
