const resetButton = document.getElementById("reset");
const si = document.getElementById("student_id");
const ssc = document.getElementById("searchschool");
const cn = document.getElementById("class_number");
const sn = document.getElementById("searchname");
const students = document.getElementsByClassName("students");
const sd = document.getElementById("studentsData");
let form = "";
ssc.addEventListener("change", async function () {
	const params = new URLSearchParams();
	params.append("school_code", ssc.value);
	await fetch("student.StudentGetClass.action", {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
	        },
	        body: params.toString()
	    })
	    .then(response => response.json())
	    .then(data => {
	        cn.innerHTML = "";
            const opt = document.createElement("option");
            opt.value = "";
            opt.textContent = "選択してください";
            cn.appendChild(opt);
	        data.forEach(item => {
            	const opt = document.createElement("option");
	            opt.value = item.class_number;
	            opt.textContent = item.class_number;
	            cn.appendChild(opt);
	        });
	    })
	    .catch(error => {
	        console.error("Error fetching class list:", error);
	    });
		StudentsSearch();
})
const search = document.getElementsByClassName("search");
for (se of search) {
	se.addEventListener("change", () => {
		StudentsSearch();
	})
}

const searchword = document.getElementsByClassName("searchword");
for (sw of searchword) {
	sw.addEventListener("change", () => {
		StudentsSearch();
	})
}

//ソートテスト
const sorts = document.getElementsByClassName("sort")
for (sort of sorts) {
	sort.addEventListener("click", (event) => {
		let index = event.target.id;
		for (sortremove of sorts) {
			if(index != sortremove.id) {
				sortremove.classList.remove("asc");
				sortremove.classList.remove("desc");
			}
		}
		if (event.target.classList.contains("asc")) {
			event.target.classList.replace("asc", "desc");
		} else if(event.target.classList.contains("desc")) {
			event.target.classList.remove("desc");
		} else {
			event.target.classList.add("asc");
		}
		console.log(event.target.className.split(" ")[1]);
		const list = []
		const list2 = []
		for (student of students) {
			for(let i = 0; i < 7; i++){
				list.push(student.children[i].textContent);
			}
		}
		const order = event.target.className.split(" ")[1];
		if (order == null){
			StudentsSearch();
		} else {
			if (index == 1) {
				index = 2;
			}
			const params = new URLSearchParams();
			const cl =[];
			params.append("test", list);
			params.append("index", index);
			params.append("order", order);
			fetch("student.StudentSort.action", {
			      method: 'POST',
			      headers: {
			          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
			      },
			      body: params.toString()
			  })
			  .then(response => response.json())
			  .then(data => {
				  students.innerHTML = "";
			      data.forEach(item => {
			    	  if (access_level == 1) {
			    			form = `<td>
                <form method="post" action="input.StudentDeleteInput.action">
                  <input type="hidden" name="student_id" value="${item.student_id}" />
                  <input type="submit" value="削除" />
                </form>
                <form method="post" action="input.StudentUpdateInput.action">
                  <input type="hidden" name="student_id" value="${item.student_id}" />
                  <input type="hidden" name="student_name" value="${item.student_name}" />
                  <input type="hidden" name="is_enrolled" value="${item.is_enrolled}" />
                  <input type="submit" value="更新" />
                </form>
              </td>`
			    		}
		            cl.push(`<tr class="students">
		                <td>${item.student_id}</td>
		                <td>${item.student_name}</td>
		            	<td>${item.student_kana}</td>
		                <td>${item.school_code}</td>
		                <td>${item.class_number}</td>
		                <td>${item.enrollment_year}</td>
		                <td>${item.is_enrolled}</td>
		                ${form}
		            </tr>`)
			      });
				  sd.innerHTML = cl.join("");
			  })
			  .catch(error => {
			      console.error("Error fetching class list:", error);
			  });

		}
	})
}

reset.addEventListener("click", () => {
	si.value = "";
	ssc.options[0].selected = true;
	sn.value = "";
	ssc.dispatchEvent(new Event('change', { bubbles: true }));

})

function StudentsSearch() {
	const params = new URLSearchParams();
	const cl =[];
	params.append("student_id", si.value);
	params.append("school_code", ssc.value);
	params.append("class_number", cn.value);
	params.append("student_name", sn.value);
		fetch("student.StudentSearch.action", {
		      method: 'POST',
		      headers: {
		          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		      },
		      body: params.toString()
		  })
		  .then(response => response.json())
		  .then(data => {
			  students.innerHTML = "";
		      data.forEach(item => {
		    	  if (access_level == 1) {
		    			form = `<td>
                <form method="post" action="input.StudentDeleteInput.action">
                  <input type="hidden" name="student_id" value="${item.student_id}" />
                  <input type="submit" value="削除" />
                </form>
                <form method="post" action="input.StudentUpdateInput.action">
                  <input type="hidden" name="student_id" value="${item.student_id}" />
                  <input type="hidden" name="student_name" value="${item.student_name}" />
                  <input type="hidden" name="is_enrolled" value="${item.is_enrolled}" />
                  <input type="submit" value="更新" />
                </form>
              </td>`
		    		}
	            cl.push(`<tr class="students">
	                <td>${item.student_id}</td>
	                <td>${item.student_name}</td>
	            	<td>${item.student_kana}</td>
	                <td>${item.school_code}</td>
	                <td>${item.class_number}</td>
	                <td>${item.enrollment_year}</td>
	                <td>${item.is_enrolled}</td>
	                ${form}
	            </tr>`)
		      });
			  sd.innerHTML = cl.join("");
		  })
		  .catch(error => {
		      console.error("Error fetching class list:", error);
		  });
}