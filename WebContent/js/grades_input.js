  const st = document.getElementById("student_id");
  const sn = document.getElementById("student_name");
  const sc = document.getElementById("school_code");
  const cn = document.getElementById("class_number");

  st.addEventListener("blur", (event) => {
    const params = new URLSearchParams();
    params.append("student_id", event.target.value);

    fetch("grades.GradesGetStudentData.action", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: params.toString()
    })
    .then(response => response.json())
    .then(data => {
      data.forEach(item => {
        sn.value = item.student_name;
        sc.value = item.school_code;
        cn.value = item.class_number;
      });
    })
    .catch(error => {
      console.error("Error fetching student data:", error);
    });
  });