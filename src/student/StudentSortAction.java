package student;
import java.io.PrintWriter;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class StudentSortAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String test = request.getParameter("test");
		int index = Integer.parseInt(request.getParameter("index"));
		System.out.println(index);
		String order = request.getParameter("order");
		List<String> testList =  Arrays.asList(test.split(","));
		List<List<String>> list = new ArrayList<>();
		int n = 0;
		for (int i = 0; i < testList.size()/7; i++) {
			list.add(testList.subList(n, n+7));
			n += 7;
		}
		if (order.equals("asc")) {
			try {
				list.sort(Comparator.comparing(row -> Integer.parseInt(row.get(index))));
			} catch (Exception e) {
				Collator collator = Collator.getInstance(Locale.JAPANESE);
				list.sort(Comparator.comparing(row -> row.get(index), collator));
			}
		} else if (order.equals("desc")) {
			try {
				list.sort(Comparator.comparing((List<String> row) -> Integer.parseInt(row.get(index))).reversed());
			} catch (Exception e) {
				Collator collator = Collator.getInstance(Locale.JAPANESE);
				list.sort(Comparator.comparing((List<String> row) -> row.get(index), collator).reversed());
			}
		}

		response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();


	    out.println("[");
	    for (int i = 0; i < list.size(); i++) {
			out.print("{\"student_id\":\"" + list.get(i).get(0) + "\",\"student_name\":\"" + list.get(i).get(1) + "\",\"student_kana\":\"" + list.get(i).get(2) + "\",\"school_code\":\"" + list.get(i).get(3) + "\",\"class_number\":\"" + list.get(i).get(4) + "\",\"enrollment_year\":\"" + list.get(i).get(5) + "\",\"is_enrolled\":\"" + list.get(i).get(6) + "\"}");
	        if (i < list.size() - 1) {
	        	out.print(",");
	        }
	    }
	    out.println("]");
	    out.close();


		return null;
	}
}
