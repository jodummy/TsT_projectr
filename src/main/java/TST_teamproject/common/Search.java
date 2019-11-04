package TST_teamproject.common;

public class Search extends Pagination{
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", getKeyword()=" + getKeyword() + ", getListSize()=" + getListSize()
				+ ", getRangeSize()=" + getRangeSize() + ", getPage()=" + getPage() + ", getRange()=" + getRange()
				+ ", getListCount()=" + getListCount() + ", getPageCnt()=" + getPageCnt() + ", getStartPage()="
				+ getStartPage() + ", getStartList()=" + getStartList() + ", getEndPage()=" + getEndPage()
				+ ", isPrev()=" + isPrev() + ", isNext()=" + isNext() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
