package spring.utility.gobook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import spring.model.freeboard_reply.Freeboard_replyDAO;

public class Utility {
	
	
	public static int rcount(int f_num,Freeboard_replyDAO rdao) {
		
		return rdao.total(f_num);
		
	}
	
	/** 
     * 파일업로드 처리(model1,mvc) 
     * @param fileItem 
     * @param upDir 
     * @return 
     */ 
    public static String saveFileSpring30(MultipartFile multipartFile, String basePath) { 
        // input form's parameter name 
        String fileName = ""; 
        // original file name 
        String originalFileName = multipartFile.getOriginalFilename(); 
        // file content type 
        String contentType = multipartFile.getContentType(); 
        // file size 
        long fileSize = multipartFile.getSize(); 
         
        System.out.println("fileSize: " + fileSize); 
        System.out.println("originalFileName: " + originalFileName); 
         
        InputStream inputStream = null; 
        OutputStream outputStream = null; 
 
        try { 
            if( fileSize > 0 ) { // 파일이 존재한다면 
                // 인풋 스트림을 얻는다. 
                inputStream = multipartFile.getInputStream(); 
 
                File oldfile = new File(basePath, originalFileName); 
             
                if ( oldfile.exists()){ 
                    for(int k=0; true; k++){ 
                        //파일명 중복을 피하기 위한 일련 번호를 생성하여 
                        //파일명으로 조합 
                        oldfile = new File(basePath,"("+k+")"+originalFileName); 
                     
                        //조합된 파일명이 존재하지 않는다면, 일련번호가 
                        //붙은 파일명 다시 생성 
                        if(!oldfile.exists()){ //존재하지 않는 경우 
                            fileName = "("+k+")"+originalFileName; 
                            break; 
                        } 
                    } 
                }else{ 
                    fileName = originalFileName; 
                } 
                //make server full path to save 
                String serverFullPath = basePath + "\\" + fileName; 
                 
                System.out.println("fileName: " + fileName); 
                System.out.println("serverFullPath: " + serverFullPath); 
                 
                outputStream = new FileOutputStream( serverFullPath ); 
  
                // 버퍼를 만든다. 
                int readBytes = 0; 
                byte[] buffer = new byte[8192]; 
 
                while((readBytes = inputStream.read(buffer, 0, 8192)) != -1 ) { 
                    outputStream.write( buffer, 0, readBytes ); 
                } 
                outputStream.close(); 
                inputStream.close(); 
                         
            } 
 
        } catch(Exception e) { 
            e.printStackTrace();   
        }finally{ 
             
        } 
         
        return fileName; 
    } 
    
    public static String getInterest_Value(String code) {
		String value=null;
		Map<String,String> codes = new HashMap<String,String>();
		codes.put("I00", "육아");
		codes.put("I01", "핸드메이드");
		codes.put("I02", "뷰티");
		codes.put("I03", "키덜트");
		codes.put("I04", "헤어");
		codes.put("I05", "숙박");
		codes.put("I06", "건강");
		codes.put("I07", "운동");
		
		value = codes.get(code);
		
		return value;
	}
	
	public static String getCodeValue(String code) {
		String value=null;
		Map<String,String> codes = new HashMap<String,String>();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각족학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		
		value = codes.get(code);
		
		return value;
	}
	
	/**
     * 오늘,어제,그제 날짜 가져오기
     * @return List- 날짜들 저장
     */
    public static List<String> getDay(){
        List<String> list = new ArrayList<String>();
        
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        for(int j = 0; j < 3; j++){
            list.add(sd.format(cal.getTime()));
            cal.add(Calendar.DATE, -1);
        }
        
        return list;
    }
    /**
     * 등록날짜와 오늘,어제,그제날짜와 비교
     * @param wdate - 등록날짜
     * @return - true:오늘,어제,그제중 등록날짜와 같음
     *           false:오늘,어제,그제 날짜가 등록날짜와 다 다름
     */
    public static boolean compareDay(String wdate){
        boolean flag = false;
        List<String> list = getDay();
        if(wdate.equals(list.get(0)) 
           || wdate.equals(list.get(1))
           || wdate.equals(list.get(2))){
            flag = true;
        }
          
        return flag;
    }
	
	/**
	 * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
	 * 18 19 20 [다음]
	 * 
	 * @param totalRecord
	 *            전체 레코드수
	 * @param nowPage
	 *            현재 페이지
	 * @param recordPerPage
	 *            페이지당 레코드 수
	 * @param col
	 *            검색 컬럼
	 * @param word
	 *            검색어
	 * @return 페이징 생성 문자열
	 */
	public static String paging3(int totalRecord, int nowPage, int recordPerPage, String col, String word) {
		int pagePerBlock = 10; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();

		str.append("<style type='text/css'>");
		str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
		str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
		str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}");
		str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
		str.append("  .span_box_1{");
		str.append("    text-align: center;");
		str.append("    font-size: 1em;");
		str.append("    border: 1px;");
		str.append("    border-style: solid;");
		str.append("    border-color: #cccccc;");
		str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("  }");
		str.append("  .span_box_2{");
		str.append("    text-align: center;");
		str.append("    background-color: #668db4;");
		str.append("    color: #FFFFFF;");
		str.append("    font-size: 1em;");
		str.append("    border: 1px;");
		str.append("    border-style: solid;");
		str.append("    border-color: #cccccc;");
		str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("  }");
		str.append("</style>");
		str.append("<DIV id='paging'>");
		// str.append("현재 페이지: " + nowPage + " / " + totalPage + " ");

		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append("<span class='span_box_1'><A href='./list.do?col=" + col + "&word=" + word + "&nowPage="
					+ _nowPage + "'>이전</A></span>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<span class='span_box_2'>" + i + "</span>");
			} else {
				str.append("<span class='span_box_1'><A href='./list.do?col=" + col + "&word=" + word + "&nowPage=" + i
						+ "'>" + i + "</A></span>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("<span class='span_box_1'><A href='./list.do?col=" + col + "&word=" + word + "&nowPage="
					+ _nowPage + "'>다음</A></span>");
		}
		str.append("</DIV>");

		return str.toString();
	}

	/**
	 * 숫자 형태의 페이징, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17 18 19 20
	 * [다음]
	 * 
	 * @param totalRecord
	 *            전체 레코드수
	 * @param nowPage
	 *            현재 페이지
	 * @param recordPerPage
	 *            페이지당 출력할 레코드 수
	 * @param col
	 *            검색 컬럼
	 * @param word
	 *            검색어
	 * @return 페이징 생성 문자열
	 */
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word) {
		int pagePerBlock = 10; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage));// 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();

		str.append("<style type='text/css'>");
		str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
		str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
		str.append(
				"  #paging A:hover{text-decoration:underline; background-color: #ffffff; color:black; font-size: 1em;}");
		str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
		str.append("</style>");
		str.append("<DIV id='paging'>");
//		str.append("현재 페이지: " + nowPage + " / " + totalPage + "  ");

		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append("[<A href='./list.jsp?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</A>]");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) { // 현재 페이지이면 강조 효과
				str.append("<span style='font-size: 1.2em; font-weight: bold;'>" + i + "</span> ");
			} else {
				str.append("<A href='./list.jsp?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i + "</A> ");
			}

		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("[<A href='./list.jsp?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</A>]");
		}
		str.append("</DIV>");

		return str.toString();
	}

	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}

		return str.trim();
	}


	public static void deleteFile(String basePath, String oldfile) {
		File file = new File(basePath,oldfile);
		
		if(file.exists()) {
			file.delete();
		}
		
	}


	public static String paging2(int totalRecord, int nPage, int recordPerPage, String url, int bbsno, int nowPage,
			String col, String word) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();

		str.append("<style type='text/css'>");
		str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
		str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
		str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}");
		str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
		str.append("  .span_box_1{");
		str.append("    text-align: center;");
		str.append("    font-size: 1em;");
		str.append("    border: 1px;");
		str.append("    border-style: solid;");
		str.append("    border-color: #cccccc;");
		str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("  }");
		str.append("  .span_box_2{");
		str.append("    text-align: center;");
		str.append("    background-color: #668db4;");
		str.append("    color: #FFFFFF;");
		str.append("    font-size: 1em;");
		str.append("    border: 1px;");
		str.append("    border-style: solid;");
		str.append("    border-color: #cccccc;");
		str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
		str.append("  }");
		str.append("</style>");
		str.append("<DIV id='paging'>");
		// str.append("현재 페이지: " + nowPage + " / " + totalPage + " ");

		int _nPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append("<span class='span_box_1'><A href='"+url+"?bbsno="+ bbsno +"&nPage="+_nPage+"&col=" + col + "&word=" + word + "&nowPage="
					+ nowPage + "'>이전</A></span>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nPage == i) {
				str.append("<span class='span_box_2'>" + i + "</span>");
			} else {
				str.append("<span class='span_box_1'><A href='"+url+"?bbsno="+ bbsno +"&nowPage="+nowPage+"&col=" + col + "&word=" + word + "&nPage=" + i
						+ "'>" + i + "</A></span>");
			}
		}

		_nPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("<span class='span_box_1'><A href='"+url+"?bbsno="+ bbsno +"&nPage="+_nPage+"&col=" + col + "&word=" + word + "&nowPage="
					+ nowPage + "'>다음</A></span>");
		}
		str.append("</DIV>");

		return str.toString();
	}
	
	
	public static String messagelistpaging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String id){ 
		   int pagePerBlock = 10; // 그룹당 페이지 수 -> 한 화면에 보여 줄 페이지 개수. 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  // ceil은 올림.
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹  // 10페이지 씩 자른 그룹의 개수: 얘도 ex) 15p 여도  2개의 그룹으로 만들기 위한 ceil.
		   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  // 페이지 그룹이 1, 11, 21 ... 등으로 시작하기 위한. // 결국 (nowGrp - 1)*10 은 십의 자리 구하기 위한. 
		   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   // 페이지 그룹이 10, 20, 30 ... 등으로 끝나기 위한.
		    
		   StringBuffer str = new StringBuffer(); // style쓰기 위한.
		    
		   str.append("<style type='text/css'>"); 
		   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
		   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
		   str.append("  .span_box_1{"); 
		   str.append("    text-align: center;");    
		   str.append("    color: #a5a5a5;"); 
		   str.append("    font-size: 1em;"); 
		   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("  }"); 
		   str.append("  .span_box_2{"); 
		   str.append("    text-align: center;");    
		   str.append("    background-color: #bbe5ea;"); 
		   str.append("    color: #FFFFFF;"); 
		   str.append("    font-size: 1em;");
		   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("  }"); 
		   str.append("</style>"); 
		   str.append("<DIV id='paging'>"); 
//		     str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
		 
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 : 이 [이전]을 사용하려면 당연히 11('그룹2')부터 사용 가능하겠지. 왜냐면 그룹 1에 해당하는 1~10까지는 이전 그룹이 없으니까.
		   if (nowGrp >= 2){ // 그래서 최소 2그룹 이상일 때, 라는 조건으로 [이전] 버튼을 활성화시키기 위한 span 태그를 작성하는 거야. 얘가 제일 먼저 나와야 하니까 제일 먼저 쓴 거고.
		     str.append("<span class='span_box_1'><A href=\"javascript:mlist('"+id+"','"+col+"','"+word+"',"+_nowPage+")\">이전</A></span>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ // 만약 totalPage가 19면 20까지 돌면 안 되니까, for문을 정지 시키는 조건망을 걸어 준다.
		       break; 
		     }
		     
		     if (nowPage == i){ 
		       str.append("<span class='span_box_2'>"+i+"</span>"); //이건 내가 보는 페이지에 해당하는 nowPage를 가지고 있는 애를 뽑아서 다른 style을 주려고.
		     }else{ //이건 내가 보는 페이지가 아니므로, 그 페이지에 해당하는 리스트로 가기 위해서 link를 걸어 준 거야.
		       str.append("<span class='span_box_1'><A href=\"javascript:mlist('"+id+"','"+col+"','"+word+"',"+i+")\">"+i+"</A></span>");   
		     } 
		   } 
		    
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
		   if (nowGrp < totalGrp){ //내가 있는 그룹넘버가 전체그룹개수보다 작을 경우에만 [다음]이 보여야 하니까.
		     str.append("<span class='span_box_1'><A href=\"javascript:mlist('"+id+"','"+col+"','"+word+"',"+_nowPage+")\">다음</A></span>"); 
		   } 
		   str.append("</DIV>"); 
		    
		   return str.toString(); 
		 }
		 
		 public static String messagesendlistpaging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String id){ 
			 int pagePerBlock = 10; // 그룹당 페이지 수 -> 한 화면에 보여 줄 페이지 개수. 
			 int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  // ceil은 올림.
			 int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹  // 10페이지 씩 자른 그룹의 개수: 얘도 ex) 15p 여도  2개의 그룹으로 만들기 위한 ceil.
			 int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
			 int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  // 페이지 그룹이 1, 11, 21 ... 등으로 시작하기 위한. // 결국 (nowGrp - 1)*10 은 십의 자리 구하기 위한. 
			 int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   // 페이지 그룹이 10, 20, 30 ... 등으로 끝나기 위한.
			 
			 StringBuffer str = new StringBuffer(); // style쓰기 위한.
			 
			 str.append("<style type='text/css'>"); 
			 str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
			 str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
			 str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
			 str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
			 str.append("  .span_box_1{"); 
			 str.append("    text-align: center;");    
			 str.append("    color: #a5a5a5;"); 
			 str.append("    font-size: 1em;"); 
			 str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
			 str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
			 str.append("  }"); 
			 str.append("  .span_box_2{"); 
			 str.append("    text-align: center;");    
			 str.append("    background-color: #bbe5ea;"); 
			 str.append("    color: #FFFFFF;"); 
			 str.append("    font-size: 1em;");
			 str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
			 str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
			 str.append("  }"); 
			 str.append("</style>"); 
			 str.append("<DIV id='paging'>"); 
//		     str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
			 
			 int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 : 이 [이전]을 사용하려면 당연히 11('그룹2')부터 사용 가능하겠지. 왜냐면 그룹 1에 해당하는 1~10까지는 이전 그룹이 없으니까.
			 if (nowGrp >= 2){ // 그래서 최소 2그룹 이상일 때, 라는 조건으로 [이전] 버튼을 활성화시키기 위한 span 태그를 작성하는 거야. 얘가 제일 먼저 나와야 하니까 제일 먼저 쓴 거고.
				 str.append("<span class='span_box_1'><A href=\"javascript:msendlist('"+id+"','"+col+"','"+word+"',"+_nowPage+")\">이전</A></span>"); 
			 } 
			 
			 for(int i=startPage; i<=endPage; i++){ 
				 if (i > totalPage){ // 만약 totalPage가 19면 20까지 돌면 안 되니까, for문을 정지 시키는 조건망을 걸어 준다.
					 break; 
				 }
				 
				 if (nowPage == i){ 
					 str.append("<span class='span_box_2'>"+i+"</span>"); //이건 내가 보는 페이지에 해당하는 nowPage를 가지고 있는 애를 뽑아서 다른 style을 주려고.
				 }else{ //이건 내가 보는 페이지가 아니므로, 그 페이지에 해당하는 리스트로 가기 위해서 link를 걸어 준 거야.
					 str.append("<span class='span_box_1'><A href=\"javascript:msendlist('"+id+"','"+col+"','"+word+"',"+i+")\">"+i+"</A></span>");   
				 } 
			 } 
			 
			 _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
			 if (nowGrp < totalGrp){ //내가 있는 그룹넘버가 전체그룹개수보다 작을 경우에만 [다음]이 보여야 하니까.
				 str.append("<span class='span_box_1'><A href=\"javascript:msendlist('"+id+"','"+col+"','"+word+"',"+_nowPage+")\">다음</A></span>"); 
			 } 
			 str.append("</DIV>"); 
			 
			 return str.toString(); 
		 }

}
