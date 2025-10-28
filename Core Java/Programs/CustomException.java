public class CustomException extends Exception{
  
  CustomException(){
  super();
  }
  CustomException(String message){
  super(message);
  }
  

public static void main(String args[]){

	try{
	  throw new CustomException("Custom exception");
	}catch(CustomException e){
		System.out.println(e.getMessage());
	e.printStackTrace();
	}
}


}