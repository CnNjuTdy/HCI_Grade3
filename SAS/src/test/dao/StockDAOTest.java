package dao;
import static org.junit.Assert.*;

import org.junit.Test;

public class StockDAOTest {	
	
	@Test
	public void findID() {
		StockDAO dao = new StockDAO();
		assertEquals(dao.findID("sh123456"),false);
		assertEquals(dao.findID("sh600050"),true);
	}
	@Test
	public void checkInput() {
		StockDAO dao = new StockDAO();
		assertEquals(dao.checkInput("sh123456"),"error");
		assertEquals(dao.checkInput("sh600050"),"中国联通");
		assertEquals(dao.checkInput("工商银行"),"工商银行");
		assertEquals(dao.checkInput("工商"),"error");
	}

}
