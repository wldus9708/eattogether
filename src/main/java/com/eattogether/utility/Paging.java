package com.eattogether.utility;

public class Paging {
	// 페이징을 위한 클래스
	private int totalCount = 0 ; // 테이블에 들어 있는 총 행의 개수
	private int totalPage = 0 ; // 전체 페이지 수
	
	private int pageNumber = 0 ; // 현재 페이지 번호
	private int pageSize = 0 ; // 한 페이지에 보여줄 행의 개수 
	private int beginRow = 0 ; // 현재 페이지에 보여지는 시작 랭킹 번호 
	private int endRow = 0 ; // 현재 페이지에 보여지는 끝 랭킹 번호 
	
	private int pageCount = 10 ; // 하단 중간에 보이는 페이지 링크 개수
	private int beginPage = 0 ; // 페이지 링크 시작 번호
	private int endPage = 0 ; // 페이지 링크 끝 번호 
	
	private String url = "" ; // 게시물 보여 주는 페이지(예시 : boList)
	private String pagingHtml = "" ; // 하단의 이전/다음/숫자 목록 페이지 하이퍼 링크를 저장하고 있는 문자열
	private String pagingStatus = "" ; // 상단 우측의 현재 페이지 현황(예시 : 총 295건[12/30])
	
	private String mode = "" ; // 검색 모드(예시 : 작성자, 글제목 등등)
	private String keyword = "" ; // 검색할 단어	
	
	private String flowParameter = "" ; // 페이지 이동시 같이 수반되는 파라미터 리스트	
	
	public Paging(String _pageNumber, String _pageSize, int totalCount, String url, String mode, String keyword, boolean isGrid) {
		
		if(_pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")) {
			_pageNumber = "1" ; // 의미 없는 페이지 번호가 넘어 오면 기본 값 "1"로 지정 
		}
		this.pageNumber = Integer.parseInt(_pageNumber);
		
		if(_pageSize == null || _pageSize.equals("null") || _pageSize.equals("")) {
			if(isGrid == true) { // 격자 형식으로 보기
				_pageSize = "25" ; // 상품 목록 보기 기본 값 "6"
			}else {
				_pageSize = "10" ; // 나머지 목록 보기 페이지 기본 값 "10" 	
			} 
		}
		this.pageSize = Integer.parseInt(_pageSize);
		
		this.totalCount = totalCount ;
		this.url = url ;
		
		// 모드가 "all"이면 전체 검색으로 간주합니다.
		this.mode = mode == null || mode.equals("null") || mode.equals("") ? "all" : mode ;
		
		this.keyword = keyword == null || keyword.equals("null") || keyword.equals("") ? "" : keyword ;
		
		double _totalPage = Math.ceil((double)totalCount/pageSize)  ;
		this.totalPage = (int)_totalPage ;
		
		this.beginRow = (pageNumber-1) * pageSize + 1;
		this.endRow = pageNumber * pageSize ;
		if(endRow > totalCount) {endRow = totalCount;}
		
		// pageNumber가 pageSize의 배수가 되면 어긋납니다.(-1 뺄셈해주기)
		this.beginPage = (pageNumber-1) / pageCount * pageCount + 1 ;
		this.endPage = beginPage + pageCount - 1 ; 
		if(endPage > totalPage) {endPage = totalPage;}
		
		this.pagingStatus = "총 " + totalCount + "건[" + pageNumber + "/" + totalPage + "]" ;
		
		this.flowParameter = "" ;
		this.flowParameter += "&pageNumber=" + pageNumber ;
		this.flowParameter += "&pageSize=" + pageSize ;
		this.flowParameter += "&mode=" + mode ;
		this.flowParameter += "&keyword=" + keyword ;
		
		this.pagingHtml = this.getMakePagingHtml() ;
	}	

	private String getMakePagingHtml() {
		String html = "" ;		
		
		html += "<ul class=\"pagination justify-content-center\" style=\"margin:20px 0\">";
		
		if(pageNumber <= pageCount) {
			/* '맨처음'과 '이전' 항목이 존재하지 않는 경우 */
		}else {
			html += makeLiTag("맨처음", 1);
			html += makeLiTag("이전", beginPage-1);
		}
		
		for (int i = beginPage; i <= endPage ; i++) {
			if(i == pageNumber) {
				// active 속성으로 활성화시키고, 빨간 색으로 진하게 표현하기
				html += "<li class=\"page-item active\">";
				html += "<a class=\"page-link\" href=\"#\">";
				html += "<b><font color='red'>" + i + "</font></b>" ;
				html += "</a></li>";	
				
			}else {
				html += makeLiTag(String.valueOf(i), i); 
			}
		}
		
		if(pageNumber >= (totalPage/pageCount*pageCount+1)) {
			/* '맨끝'과 '다음' 항목이 존재하지 않는 경우 */
		}else {
			html += makeLiTag("다음", endPage+1);
			html += makeLiTag("맨끝", totalPage);			
		}
		
		html += "</ul>" ;
		
		return html;
	}

	private String makeLiTag(String caption, int currPageNumber) {
		// caption : 보여지는 문자열(이전, 다음 등등) 
		// currPageNumber : 이동할 페이지 번호
		String result = "" ;
		
		result += "<li class='page-item'>";
		result += "<a class='page-link' href='" ;
		result += this.url ;
		result += "&pageNumber=" + currPageNumber;
		result += "&pageSize=" + this.pageSize;
		result += "&mode=" + this.mode;
		result += "&keyword=" + this.keyword;
		result += "'>" ;
		result += caption ;
		result += "</a></li>";		
		
		return result ;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBeginRow() {
		return beginRow;
	}

	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String getPagingStatus() {
		return pagingStatus;
	}

	public void setPagingStatus(String pagingStatus) {
		this.pagingStatus = pagingStatus;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFlowParameter() {
		return flowParameter;
	}

	public void setFlowParameter(String flowParameter) {
		this.flowParameter = flowParameter;
	}

	@Override
	public String toString() {
		String imsi = "" ;
		imsi += "totalCount=" + totalCount  + ", ";
		imsi += "totalPage=" + totalPage  + ", ";
		imsi += "pageNumber=" + pageNumber  + ", ";
		imsi += "pageSize=" + pageSize  + ", ";
		imsi += "beginRow=" + beginRow  + ", ";
		imsi += "endRow=" + endRow  + ", ";
		imsi += "pageCount=" + pageCount  + ", ";
		imsi += "beginPage=" + beginPage  + ", ";
		imsi += "endPage=" + endPage  + ", ";
		imsi += "url=" + url  + ", ";
		imsi += "pagingStatus=" + pagingStatus  + ", ";
		imsi += "mode=" + mode  + ", ";
		imsi += "keyword=" + keyword  + ", ";
		imsi += "flowParameter=" + flowParameter  + "\n";
		imsi += "pagingHtml=\n" + pagingHtml  + "\n";		
		return imsi ;
	}
	
}
