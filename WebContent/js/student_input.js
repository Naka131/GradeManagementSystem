function limitLength(el, maxLength) {
	    if (el.value.length > maxLength) {
	      el.value = el.value.slice(0, maxLength);
	    }
	  }

	  const sc = document.getElementById("school_code");
	  const params = new URLSearchParams();
	  params.append("school_code", sc.value);
	  fetch("student.StudentGetClass.action", {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
	        },
	        body: params.toString()
	    })
	    .then(response => response.json())
	    .then(data => {
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
	  
	  const cn = document.getElementById("class_number");
	  sc.addEventListener("change", (event) => {
		  const cl = [];
		  const params = new URLSearchParams();
		  params.append("school_code", event.target.value);
		  fetch("student.StudentGetClass.action", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		        },
		        body: params.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        cn.innerHTML = "";
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
		});
	  
	  function limitLength(elem, maxLength) {
	    if (elem.value.length > maxLength) {
	      elem.value = elem.value.slice(0, maxLength);
	    }
	  }