package testgogo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.Product;
import com.briup.Dao.ProductMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class TestProduct {

	private static SqlSession session;
	private static ProductMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(ProductMapper.class);
	}
	
	@Test
	public void SelectAll(){
		List<Product> list = mapper.selectAllProduct();
		System.out.println(list);
		for (Product product : list) {
			System.out.println(product);
		}
	}
	
	@Test
	public void selectProductById(){
		 Product product = mapper.selectProductById(7);
		 System.out.println(product);
	}
	
	@Test
	public void selectProductBylikeName(){
		List<Product> list = mapper.selectProductBylikeName("C");
		for (Product product : list) {
			System.out.println(product);
		}
	}
	
	@Test
	public void selectProByCID(){
		List<Product> list = mapper.selectProByCID(2);
		for (Product product : list) {
			System.out.println(product);
		}
	}

	@Test
	public void selectProByDID(){
		List<Product> list = mapper.selectProByDID(11);
		for (Product product : list) {
			System.out.println(product);
		}
	}
	
	@Test
	public void selectCAT_DETAILbyID(){
		HashMap<Object, Object> list = mapper.selectCAT_DETAILbyID(7);
		Collection<Object> keySet = list.values();  
		System.out.println(keySet);
	}
	
}
