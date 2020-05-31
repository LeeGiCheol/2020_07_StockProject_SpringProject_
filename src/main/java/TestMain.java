import com.bitcamp.project.vo.PagingVO;

public class TestMain {
	public static void main(String[] args) {
		PagingVO pv = new PagingVO(244, 8, 10);
		System.out.println((int) Math.ceil((double)244 / (double)10));
	}
}
