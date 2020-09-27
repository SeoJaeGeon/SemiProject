package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) { // <- 원본 파일이 매개변수로 들어옴
		// 변경명 규칙은 파일 업로드 시간(년월일시분초) + 0~10만 사이의 랜덤값(5자리) 
		// 2020061113035099999.jpg
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		
		int ranNum = (int)(Math.random() * 100000);	// 5자리 랜덤 숫자 생성
		
		// 파일명을 변경하더라도 기존 확장자를 유지하기 위하여 별도로 확장자명 가져오기
		String name = originFile.getName();	// 원본 파일명 알아내는 메소드 --> "aaa.png"
		
		int dot = name.lastIndexOf(".");	// 문자열에서 .의 위치 인덱스 알아내기
		
		String ext = "";	// 확장자만 추출해서 담아줄 변수 미리 선언 
		
		if(dot != -1) {	// -1은 해당 문자가 없다는 의미
			// dot 포함해서 이후 문자열 확장자를 추출
			ext = name.substring(dot);	// .의 위치 값부터 마지막까지 전체 추출 --> ".png"
		}
		
		// 최종적으로 수정할 파일명
		String fileName = ft.format(new Date()) + ranNum + ext;
		
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;	// <- 변경 된 파일 리턴
	}

}
