package com.bitcamp.project.util;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;

import com.bitcamp.project.vo.BoardVO;

public class FileUpload {

	public BoardVO file(HttpServletRequest request, HttpServletResponse response) {
		BoardVO vo = new BoardVO();

		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");

			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();

			// 날짜
			SimpleDateFormat fileNameFormatter = new SimpleDateFormat("yyyyMMddHHmmss");
			SimpleDateFormat folderNameFormatter = new SimpleDateFormat("yyyyMMdd");
			String fileNameToday = fileNameFormatter.format(new java.util.Date());
			String folderNameToday = folderNameFormatter.format(new java.util.Date());
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "resources" + File.separator + "se2/upload/" + File.separator
					+ folderNameToday + "/" + File.separator;

			File file = new File(filePath);

			if (!file.exists()) {
				file.mkdirs();
			}

			String realFileNm = "";

			realFileNm = "Photo" + fileNameToday + UUID.randomUUID().toString()
					+ filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);

			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}

			if (is != null) {
				is.close();
			}

			os.flush();
			os.close();

			///////////////// 서버에 파일쓰기 /////////////////

			// 정보 출력
			sFileInfo += "&bNewLine=true";

			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "/resources/se2/upload/" + folderNameToday + "/" + realFileNm;
			System.out.println("sFileInfo " + sFileInfo);
			System.out.println(folderNameToday);
			thumbnail(realFileNm, filePath, filename_ext);
			vo.setThumbnailName(folderNameToday + "/" + realFileNm);

			PrintWriter print = response.getWriter();

			print.print(sFileInfo);
			print.flush();

			print.close();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return vo;
	}
	
	

	public void thumbnail(String realFileNm, String filePath, String filename_ext) {
		try {
			System.out.println("tpath " + filePath);
			System.out.println("trerere " +realFileNm );
			System.out.println("tfilename_ext " +filename_ext );

			// 원본 이미지 입니다.
			BufferedImage srcImg = ImageIO.read(new File(filePath + realFileNm));

			// 썸네일 크기 입니다.
			int dw = 450, dh = 270;

			// 원본이미지 크기 입니다.
			int ow = srcImg.getWidth();
			int oh = srcImg.getHeight();

			// 늘어날 길이를 계산하여 패딩합니다.
			int pd = 0;
			if (ow > oh) {
				pd = (int) (Math.abs((dh * ow / (double) dw) - oh) / 2d);
			} else {
				pd = (int) (Math.abs((dw * oh / (double) dh) - ow) / 2d);
			}
			srcImg = Scalr.pad(srcImg, pd, Color.WHITE, Scalr.OP_ANTIALIAS);

			// 이미지 크기가 변경되었으므로 다시 구합니다.
			ow = srcImg.getWidth();
			oh = srcImg.getHeight();

			// 썸네일 비율로 크롭할 크기를 구합니다.
			int nw = ow;
			int nh = (ow * dh) / dw;
			if (nh > oh) {
				nw = (oh * dw) / dh;
				nh = oh;
			}

			// 늘려진 이미지의 중앙을 썸네일 비율로 크롭 합니다.
			BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);

			// 리사이즈(썸네일 생성)
			BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

			// 이미지 출력
			String thumbName = filePath + "THUMB_" + realFileNm;
			File thumbFile = new File(thumbName);
			ImageIO.write(destImg, filename_ext.toUpperCase(), thumbFile);

//			
//			
//			
//			
//			// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다. 
//			BufferedImage srcImg = ImageIO.read(new File(filePath+realFileNm)); 
//			// 썸네일의 너비와 높이 입니다. 
//			int dw = 250, dh = 150; 
//			// 원본 이미지의 너비와 높이 입니다. 
//			int ow = srcImg.getWidth(); 
//			int oh = srcImg.getHeight(); 
//			// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
//			int nw = ow; 
//			int nh = (ow * dh) / dw; 
//			// 계산된 높이가 원본보다 높다면 crop이 안되므로 
//			// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다. 
//			if(nh > oh) { 
//				nw = (oh * dw) / dh; 
//				nh = oh; 
//			} // 계산된 크기로 원본이미지를 가운데에서 crop 합니다. 
//			BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh); 
//
//
//			// crop된 이미지로 썸네일을 생성합니다.
//			BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, 250);
//			// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다. 
//			String thumbName = filePath + "THUMB_" + realFileNm; 
//			File thumbFile = new File(thumbName);
//			ImageIO.write(destImg, filename_ext.toUpperCase(), thumbFile); 
//			
//			

//			
//			
//            //썸네일 가로사이즈
//            int thumbnail_width = 500;
//            //썸네일 세로사이즈
//            int thumbnail_height = 500;
//            
//            //원본이미지파일의 경로+파일명
//            File origin_file_name = new File(filePath+realFileNm);
//            System.out.println("origin_file_name " + origin_file_name);
//            //생성할 썸네일파일의 경로+썸네일파일명
//            File thumb_file_name = new File(filePath+File.separator+"thumbnail_"+realFileNm);
// 
//            BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
//            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
//            Graphics2D graphic = buffer_thumbnail_image.createGraphics();
//            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
//            ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
//            System.out.println("썸네일 생성완료");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	public void thumbnailUpdate(String realFileNm, String filePath, String filename_ext) {
		try {
			System.out.println("tpath " + filePath);
			System.out.println("trerere " +realFileNm );
			System.out.println("tfilename_ext " +filename_ext );
			System.out.println(filePath + realFileNm);
			File f = new File(filePath + realFileNm+"."+filename_ext);
			// 원본 이미지 입니다.
			System.out.println(new File(filePath + realFileNm+"."+filename_ext).exists());
			BufferedImage srcImg = ImageIO.read(f);

			// 썸네일 크기 입니다.
			int dw = 450, dh = 270;

			// 원본이미지 크기 입니다.
			int ow = srcImg.getWidth();
			int oh = srcImg.getHeight();

			// 늘어날 길이를 계산하여 패딩합니다.
			int pd = 0;
			if (ow > oh) {
				pd = (int) (Math.abs((dh * ow / (double) dw) - oh) / 2d);
			} else {
				pd = (int) (Math.abs((dw * oh / (double) dh) - ow) / 2d);
			}
			srcImg = Scalr.pad(srcImg, pd, Color.WHITE, Scalr.OP_ANTIALIAS);

			// 이미지 크기가 변경되었으므로 다시 구합니다.
			ow = srcImg.getWidth();
			oh = srcImg.getHeight();

			// 썸네일 비율로 크롭할 크기를 구합니다.
			int nw = ow;
			int nh = (ow * dh) / dw;
			if (nh > oh) {
				nw = (oh * dw) / dh;
				nh = oh;
			}

			// 늘려진 이미지의 중앙을 썸네일 비율로 크롭 합니다.
			BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);

			// 리사이즈(썸네일 생성)
			BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

			// 이미지 출력
			String thumbName = filePath + "THUMB_" + realFileNm+"."+filename_ext;
			File thumbFile = new File(thumbName);
			ImageIO.write(destImg, filename_ext.toUpperCase(), thumbFile);

//			
//			
//			
//			
//			// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다. 
//			BufferedImage srcImg = ImageIO.read(new File(filePath+realFileNm)); 
//			// 썸네일의 너비와 높이 입니다. 
//			int dw = 250, dh = 150; 
//			// 원본 이미지의 너비와 높이 입니다. 
//			int ow = srcImg.getWidth(); 
//			int oh = srcImg.getHeight(); 
//			// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
//			int nw = ow; 
//			int nh = (ow * dh) / dw; 
//			// 계산된 높이가 원본보다 높다면 crop이 안되므로 
//			// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다. 
//			if(nh > oh) { 
//				nw = (oh * dw) / dh; 
//				nh = oh; 
//			} // 계산된 크기로 원본이미지를 가운데에서 crop 합니다. 
//			BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh); 
//
//
//			// crop된 이미지로 썸네일을 생성합니다.
//			BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, 250);
//			// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다. 
//			String thumbName = filePath + "THUMB_" + realFileNm; 
//			File thumbFile = new File(thumbName);
//			ImageIO.write(destImg, filename_ext.toUpperCase(), thumbFile); 
//			
//			

//			
//			
//            //썸네일 가로사이즈
//            int thumbnail_width = 500;
//            //썸네일 세로사이즈
//            int thumbnail_height = 500;
//            
//            //원본이미지파일의 경로+파일명
//            File origin_file_name = new File(filePath+realFileNm);
//            System.out.println("origin_file_name " + origin_file_name);
//            //생성할 썸네일파일의 경로+썸네일파일명
//            File thumb_file_name = new File(filePath+File.separator+"thumbnail_"+realFileNm);
// 
//            BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
//            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
//            Graphics2D graphic = buffer_thumbnail_image.createGraphics();
//            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
//            ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
//            System.out.println("썸네일 생성완료");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	

	public BoardVO fileUpdate(BoardVO vo, List<String> uploadedFileName, List<String> uploadThumbnail, HttpServletRequest request) {
		String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");

for (int i = 1; i < img.length; i++) {
			
			int start = img[i].indexOf("/Photo");
			int end = img[i].indexOf("\" title=\"");
			img[i] = img[i].substring(start-8, end);
		}
		

		String thumbnail = null;
		
		try {
			if(uploadedFileName.size() != 0) {
				for (int i = 0; i < uploadedFileName.size(); i++) {
					int a = 0;
					for (int j = 1; j < img.length; j++) {
						if(uploadedFileName.get(i).equals(img[j])) {
							uploadThumbnail.add(uploadedFileName.get(i));
							a++;
						}
					}
					// 파일이 존재하지 않을 경우 삭제
					if(a != 1) {
						String origin = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+uploadedFileName.get(i);
						File originDelete = new File(origin);
						thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ uploadedFileName.get(i).substring(0,8) + "/THUMB_" + uploadedFileName.get(i).substring(9);
						File thumbnailDelete = new File(thumbnail);
						
						// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
						if(originDelete.exists()) {
						    // 파일을 삭제합니다.
							originDelete.delete();
							thumbnailDelete.delete();
						}
						    
					}
				}
			}else {
				uploadThumbnail.add(img[1]);
				
				int size = img.length;
				String thumbRoot[] = new String[size];
				
				for (int i = 1; i < img.length; i++) {
						String origin = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+img[i];
						File originDelete = new File(origin);
						thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ img[i].substring(0,8) + "/THUMB_" + img[i].substring(9);
						
						String filename_ext = thumbnail.substring(thumbnail.lastIndexOf(".")+1);
						int thumbnailIdx = uploadThumbnail.get(0).indexOf(".");
						String realThumbnailName = uploadThumbnail.get(0).substring(0, thumbnailIdx);
						String path = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ img[1].substring(0,8)+"/";

						System.out.println("cpath " + realThumbnailName.substring(9));
						System.out.println("crerere " +path );
						System.out.println("cfilename_ext " +filename_ext );

						
						thumbnailUpdate(realThumbnailName.substring(9),path, filename_ext);
						
						File thumbnailDelete = new File(thumbnail);
						
						// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
//						if(originDelete.exists()) {
//						    // 파일을 삭제합니다.
//							thumbnailDelete.delete();
//						}else {
//							originDelete.delete();
//							
						    
//					}
				}
			}
			
//			List<String> upload = multiplePhotoUpload(request, response);
			
			
			
			vo.setThumbnailName("/resources/se2/upload/"+uploadThumbnail.get(0).substring(0,8) + "/THUMB_" + uploadThumbnail.get(0).substring(9));
			uploadedFileName.clear();
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		return vo;
		
		
	}

	public BoardVO fileDel(BoardVO vo, List<String> uploadedFileName, List<String> uploadThumbnail,
			HttpServletRequest request) {
		String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");

		for (int i = 1; i < img.length; i++) {

			int start = img[i].indexOf("/Photo");
			int end = img[i].indexOf("\" title=\"");
			img[i] = img[i].substring(start - 8, end);
		}

		String thumbnail = null;

		try {

			for (int j = 1; j < img.length; j++) {

				String origin = request.getSession().getServletContext().getRealPath("/") + "resources/se2/upload/"
						+ img[j];
				File originDelete = new File(origin);
				thumbnail = request.getSession().getServletContext().getRealPath("/") + "resources/se2/upload/"
						+ img[j].substring(0, 8) + "/THUMB_" + img[j].substring(9);
				File thumbnailDelete = new File(thumbnail);

				// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
				if (originDelete.exists()) {
					// 파일을 삭제합니다.
					originDelete.delete();
					thumbnailDelete.delete();

				}
			}

//				if(thumbnailDelete.exists()) {
//				    // 파일을 삭제합니다.
//				}

			// vo에 저장 후 리셋
			vo.setThumbnailName("/resources/se2/upload/" + img[1].substring(0, 8) + "/THUMB_" + img[1].substring(9));
			uploadedFileName.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;

	}

}
