package exceptions;

/**
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 */
@SuppressWarnings("serial")
public class NoLoginException extends Exception{
	
	private String pageDenied;
	
	public NoLoginException(String pageDenied){
		this.pageDenied = pageDenied;
	}
	
	public String getPageDenied() {
		return pageDenied;
	}
	
	@Override
	public String toString(){
		return "Access denied to "+pageDenied;
	}

}
