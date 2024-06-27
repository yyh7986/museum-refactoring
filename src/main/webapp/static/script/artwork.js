function go_search_artwork() {
    let inputText = document.searchForm.searchWord.value;
    if (inputText === "") {
        alert("검색어를 입력하세요");
        return false;
    } else {
        return true;
    }
}

function artworkUpdate() {
    let form = document.artworkWriteForm;
    if (form.artist.value === "")
        alert("작가명을 입력하세요");
    else if (form.artname.value === "")
        alert("작품명을 입력하세요");
    else if (form.year.value === "")
        alert("제작연도를 입력하세요")
    else if (form.material.value === "")
        alert("재료를 입력하세요")
    else if (form.size.value === "")
        alert("규격을 입력하세요")
    else if (form.category.value === "")
        alert("카테고리를 선택하세요")
    else if (form.content.value === "")
        alert("작품설명을 입력하세요")
    else if (form.displayYn.value === "")
        alert("전시여부를 선택하세요")
    else {
        form.submit();
    }
}

function artistUnknown() {
    let form = document.artworkWriteForm;

    if (form.unknownArtist.checked)
        form.artist.value = "작자미상";
    else
        form.artist.value = "";
}

function yearUnknown() {
    let form = document.artworkWriteForm;

    if (form.unknownYear.checked)
        form.year.value = "연도미상";
    else
        form.year.value = "";
}

function previewImage(input) {
    let reader = new FileReader(); // 파일을 읽을 FileReader 객체 생성
    let form = document.artworkWriteForm;
    reader.onload = function () {
        let output = form.uploadedImage;
        output.src = reader.result; // 파일의 데이터를 img 태그의 src에 설정
    };
    reader.readAsDataURL(event.target.files[0]); // 선택한 파일을 읽어들임
}

function go_deleteArtwork(aseq) {
    let ans = confirm("정말 삭제하시겠습니까?")
    if (ans) {
        location.href = "delete?aseq=" + aseq;
        alert("예술품 정보가 삭제되었습니다");
    } else {
        return
    }
}

function changeValue(type) {
    let form = document.artworkWriteForm;
    if (type === "unknownYear") form.unknownYear.checked = false;
    else if (type === "unknownArtist") form.unknownArtist.checked = false;
}


function fileUp() {
    const $fileUpForm = document.getElementById("fileUp");
    const $fileUpBtn = document.querySelector("#fileUpBtn");
    const $prevImg = document.querySelector("#prevImg");
    const $image = document.querySelector("#image");
    const $savefilename = document.querySelector("#savefilename");

    let formdata = new FormData($fileUpForm);
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/artwork/fileup", true);

    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            let data = JSON.parse(xhr.responseText);
            if (data.STATUS == 1) {
                let div = document.createElement('div');
                div.textContent = data.SAVEFILENAME;

                let img = document.createElement('img');
                img.src = "/static/image/artwork/" + data.SAVEFILENAME;
                img.height = "150";
                $prevImg.append(div, img);

                $image.value = data.IMAGE;
                $savefilename.value = data.SAVEFILENAME;
            }
        }

    }
    xhr.send(formdata);
}

/*
function changeCategory(category){
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/artwork/chcg?category="+category, true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            let data = JSON.parse(xhr.responseText);
            console.log(data);

            const $artworkList = document.getElementById("test1");
            $artworkList.innerHTML = "";

            $artworkList.append

        }
    }
    xhr.send();
}*/

function changeDisplayState(aseq) {
    $displayState = document.getElementById("displayState");
    fetch("artwork/changeDisplayState?aseq=" + aseq)
        .then(res => {
            if(!res.ok){
                console.log("ERROR : " + res.statusText);
            }else{
                return res.json();
            }
        })
        .then(data=>{
            let dpState = document.createElement('span');
            if(data.displayyn === "Y"){
                dpState.innerText = "공개"
            }else{
                dpState.innerText = "비공개"
            }
            $displayState.innerHTML = "";
            $displayState.appendChild(dpState);
        })
        .catch(err =>{
            console.log("ERROR : " + err);
        })
}