package com.aroundog.common.file;

import java.io.File;

import org.springframework.stereotype.Component;

//중립적이어야함..
@Component
public class FileManager {
	private ReNameSercurity rs = new ReNameSercurity();

	//파일명 중 확장자 추출하여 반환하는 메서드
	public  String getExt(String path){
		int lastIndex=path.lastIndexOf(".");
		return path.substring(lastIndex+1, path.length());
	}
	
	//지정한 경로에 파일을 저장하는 메서드!!
		public boolean save() {
			return false;
		}
		
	//파일명 바꾸기 : 원리는 새로운 파일명을 날짜를 이용한다
	public String reNameByDate(File ori, String dir) {
		long time=System.currentTimeMillis();
		String filename=time+"."+getExt(ori.getName()); //파일이름
		boolean result=ori.renameTo(new File(dir+"/"+filename));
		return filename;
	}
	
	public String reNameByHash(File ori,String dir) {
		String hash = rs.textToHash(ori.getName());
		String filename = hash+"."+getExt(ori.getName());
		boolean result = ori.renameTo(new File(dir+"/"+filename));      
		return filename;
	}
    public void deleteFile(String[] fileList,String dir) {
        for(int i=0;i<fileList.length;i++) {
           File file = new File(dir+"/"+fileList[i]);
           if(file.exists()) {
              if(file.delete()) {
                 System.out.println(fileList[i]+" 파일 삭제 성공");
              }else {
                 System.out.println(fileList[i]+" 파일 삭제 실패");
              }
           }else {
              System.out.println("파일이 존재하지 않습니다.");
           }
        }
     }
    //1개 파일 지우기
    public void deleteFile(String fileName, String dir) {
          File file = new File(dir+"/"+fileName);
          if(file.exists()) {
             if(file.delete()) {
                System.out.println(file+" 파일 삭제 성공");
             }else {
                System.out.println(file+" 파일 삭제 실패");
             }
          }else {
             System.out.println("파일이 존재하지 않습니다.");
          }
    }
		
		/*
		public static void main(String[] args) {
			FileManager fm=new FileManager();
			System.out.println(fm.getExt("지난여름.jpg")); 
		}
		*/
}
