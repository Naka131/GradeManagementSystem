const resetButton = document.getElementById("reset");
const si = document.getElementById("student_id");
const ssc = document.getElementById("searchschool");
const cn = document.getElementById("class_number");
const sj = document.getElementById("subject_name");
const an = document.getElementById("attempt_number");
const sn = document.getElementById("searchname");
const grades = document.getElementsByClassName("grades");
const gd = document.getElementById("gradesData");
const avg = document.getElementById("avg");
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
		GradesSearch();
})
const search = document.getElementsByClassName("search");
for (se of search) {
	se.addEventListener("change", () => {
		GradesSearch();
	})
}

const searchword = document.getElementsByClassName("searchword");
for (sw of searchword) {
	sw.addEventListener("change", () => {
		GradesSearch();
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
		for (grade of grades) {
			for(let i = 0; i < 8; i++){
				list.push(grade.children[i].textContent);
			}
		}
		const order = event.target.className.split(" ")[1];
		if (order == null){
			console.log("w");
			GradesSearch();
		} else {
			if (index == 1) {
				index = 2;
			}
			const params = new URLSearchParams();
			const cl =[];
			params.append("test", list);
			params.append("index", index);
			params.append("order", order);
			fetch("grades.GradesSort.action", {
			      method: 'POST',
			      headers: {
			          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
			      },
			      body: params.toString()
			  })
			  .then(response => response.json())
			  .then(data => {
				  grades.innerHTML = "";
			      data.forEach(item => {
			    	  if (access_level == 1) {
			    			form = `
			    			<td class="actions">
				    		    <form method="post" action="grades.GradesDeleteInput.action" style="display:inline;">
					    		    <input type="hidden" name="student_id" value="${item.student_id}" />
					    		    <input type="hidden" name="subject_name" value="${item.subject_name}" />
					    		    <input type="hidden" name="attempt_number" value="${item.attempt_number}" />
					    		    <input type="submit" value="削除" />
				    			</form>
					    		<form method="post" action="input.GradesUpdateInput.action" style="display:inline;">
					    		    <input type="hidden" name="student_id" value="${item.student_id}" />
			    					<input type="hidden" name="student_name" value="${item.student_name}" />
					    		    <input type="hidden" name="subject_name" value="${item.subject_name}" />
					    		    <input type="hidden" name="attempt_number" value="${item.attempt_number}" />
					    		    <input type="submit" value="更新" />
					    		</form>
			    			</td>
			    		`
			    		}
		            cl.push(`<tr class="grades">
		                <td>${item.student_id}</td>
		                <td>${item.student_name}</td>
		            	<td>${item.student_kana}</td>
		                <td>${item.school_code}</td>
		                <td>${item.class_number}</td>
		                <td>${item.subject_name}</td>
		                <td>${item.attempt_number}</td>
		                <td>${item.score}</td>
		                ${form}
		            </tr>`)
			      });
				  gd.innerHTML = cl.join("");
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
	sj.options[0].selected = true;
	an.options[0].selected = true;
	sn.value = "";
	ssc.dispatchEvent(new Event('change', { bubbles: true }));

})

function GradesSearch() {
	const params = new URLSearchParams();
	const cl =[];
	params.append("student_id", si.value);
	params.append("school_code", ssc.value);
	params.append("class_number", cn.value);
	params.append("subject_name", sj.value);
	params.append("attempt_number", an.value);
	params.append("student_name", sn.value);
		fetch("grades.GradesSearch.action", {
		      method: 'POST',
		      headers: {
		          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		      },
		      body: params.toString()
		  })
		  .then(response => response.json())
		  .then(data => {
			  grades.innerHTML = "";
			  if (data.length == 0) {
				  avg.innerHTML = "";
			  } else {
				  avg.innerHTML = `平均点:${data[0].avg}`
			  }
		      data.forEach(item => {
		    	  if (access_level == 1) {
		    			form = `
			    			<td class="actions">
				    		    <form method="post" action="grades.GradesDeleteInput.action" style="display:inline;">
					    		    <input type="hidden" name="student_id" value="${item.student_id}" />
					    		    <input type="hidden" name="subject_name" value="${item.subject_name}" />
					    		    <input type="hidden" name="attempt_number" value="${item.attempt_number}" />
					    		    <input type="submit" value="削除" />
				    			</form>
					    		<form method="post" action="input.GradesUpdateInput.action" style="display:inline;">
					    		    <input type="hidden" name="student_id" value="${item.student_id}" />
				    				<input type="hidden" name="student_name" value="${item.student_name}" />
					    		    <input type="hidden" name="subject_name" value="${item.subject_name}" />
					    		    <input type="hidden" name="attempt_number" value="${item.attempt_number}" />
					    		    <input type="submit" value="更新" />
					    		</form>
		    				</td>
		    		`
		    		}
	            cl.push(`<tr class="grades">
	                <td>${item.student_id}</td>
	                <td>${item.student_name}</td>
	            	<td>${item.student_kana}</td>
	                <td>${item.school_code}</td>
	                <td>${item.class_number}</td>
	                <td>${item.subject_name}</td>
	                <td>${item.attempt_number}</td>
	                <td>${item.score}</td>
	                ${form}
	            </tr>`)
		      });
			  gd.innerHTML = cl.join("");
		  })
		  .catch(error => {
		      console.error("Error fetching class list:", error);
		  });
}