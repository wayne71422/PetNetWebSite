document.addEventListener('DOMContentLoaded', function() {
    const saveDiaryBtn = document.getElementById('saveDiaryBtn');
    const newDiaryForm = document.getElementById('newDiaryForm');
    const newDiaryModal = document.getElementById('newDiaryModal');

    saveDiaryBtn.addEventListener('click', function() {
        if (newDiaryForm.checkValidity()) {
            const title = document.getElementById('diaryTitle').value;
            const content = document.getElementById('diaryContent').value;
            const photo = document.getElementById('diaryPhoto').files[0];

            // 這裡可以添加保存日記的邏輯
            console.log('標題:', title);
            console.log('內容:', content);
            console.log('照片:', photo);

            // 關閉 Modal
            document.getElementById('closeModalBtn').click();

            // 重置表單
            newDiaryForm.reset();
        } else {
            newDiaryForm.reportValidity();
        }
    });

    const arrowsY = document.querySelectorAll('.arrow-down-y');
    arrowsY.forEach(arrow => {
        arrow.addEventListener('click', function(event){
            const elements = event.target.parentNode.parentNode.children;
            Array.from(elements).forEach(element => {
                if (element.className == 'month-box' && element.style.display == 'block') {
                    element.style.display = 'none';
                    event.target.textContent = '▼';
                    event.target.parentNode.style.backgroundColor = 'rgb(146, 199, 249)';
                    
                } else if (element.className == 'month-box') {
                    element.style.display = 'block';
                    event.target.textContent = '▲';
                    event.target.parentNode.style.backgroundColor = 'rgb(84, 160, 160)';
                }
            });
        });
    });

    const arrowsM = document.querySelectorAll('.arrow-down-m');
    arrowsM.forEach(arrow => {
        arrow.addEventListener('click', function(event){
            const elements = event.target.parentNode.parentNode.children;
            Array.from(elements).forEach(element => {
                if (element.classList.contains('container') && element.style.display == 'block') {
                    element.style.display = 'none';
                    event.target.textContent = '▼';
                    event.target.parentNode.style.backgroundColor = 'rgb(56, 166, 240)';
                    
                } else if (element.classList.contains('container')) {
                    element.style.display = 'block';
                    event.target.textContent = '▲';
                    event.target.parentNode.style.backgroundColor = 'rgb(84, 160, 160)';
                }
            });
        });
    });
});

// const addPhoto = () => {
//     const uploadPhoto = document.getElementById("uploadPhoto");
//     const inputFile = document.createElement("input");
//     inputFile.type = "file";
//     inputFile.className = "form-control";
//     inputFile.classList.add("photos");
//     inputFile.accept = "image/*";
  
//     uploadPhoto.appendChild(inputFile);
//   };

function addPhoto() {
    const newUploadContainer = document.createElement('div');
    newUploadContainer.className = 'mt-2';

    const newInput = document.createElement('input');
    newInput.type = 'file';
    newInput.className = 'form-control photos';
    newInput.accept = 'image/*';

    const tagsContainer = document.createElement('div');
    tagsContainer.className = 'container mt-2 chooseTags';
    const tagsLabel = document.createElement('label');
    tagsLabel.innerHTML = '選擇照片中有的寵物';
    const tagsDiv = document.createElement('div');
    tagsDiv.className = 'border p-2 tags-background';

    const tagOptions = ['aa', 'bb', 'cc', 'ddhhhhh', 'ee'];
    tagOptions.forEach(tag => {
        const tagDiv = document.createElement('div');
        tagDiv.className = 'selectable-option';
        tagDiv.dataset.value = tag;
        tagDiv.innerText = tag;
        tagDiv.onclick = (event) => toggleOption(event, newUploadContainer);
        tagsDiv.appendChild(tagDiv);
    });

    const selectedTagsDiv = document.createElement('div');
    selectedTagsDiv.className = 'mt-2';
    const selectedTagsLabel = document.createElement('label');
    selectedTagsLabel.innerHTML = '已選擇的寵物';
    const selectedTagsInput = document.createElement('input');
    selectedTagsInput.type = 'text';
    selectedTagsInput.name = 'selectedTags';
    selectedTagsInput.className = 'form-control';
    selectedTagsInput.readOnly = true;
    selectedTagsInput.dataset.selectedTags = ''; // 存儲選擇的標籤

    tagsContainer.appendChild(tagsLabel);
    tagsContainer.appendChild(tagsDiv);
    selectedTagsDiv.appendChild(selectedTagsLabel);
    selectedTagsDiv.appendChild(selectedTagsInput);
    newUploadContainer.appendChild(newInput);
    newUploadContainer.appendChild(tagsContainer);
    newUploadContainer.appendChild(selectedTagsDiv);

    document.getElementById('uploadPhoto').appendChild(newUploadContainer);
}

function toggleOption(event, uploadContainer) {
    const option = event.currentTarget;
    const selectedTagsInput = uploadContainer.querySelector('input[name="selectedTags"]');
    let selectedTags = selectedTagsInput.dataset.selectedTags.split(',').filter(tag => tag);

    if (option.classList.contains('selected')) {
        option.classList.remove('selected');
        selectedTags = selectedTags.filter(tag => tag !== option.dataset.value);
    } else {
        option.classList.add('selected');
        selectedTags.push(option.dataset.value);
    }

    selectedTagsInput.dataset.selectedTags = selectedTags.join(',');
    selectedTagsInput.value = selectedTags.join(', ');
}
const ShowMonth = (yearBoxId) => {
    const monthBoxId = yearBoxId.replace('year', 'month');
    const monthBox = document.getElementById(monthBoxId);
    const yearBox = document.getElementById(yearBoxId);
    const yearArrow = document.querySelector(`#${yearBoxId} .arrow-down`);

    if (monthBox.style.display == 'none') {
        monthBox.style.display = 'flex';
        yearArrow.textContent = '▲';
        yearBox.style.backgroundColor = 'rgb(146, 199, 249)';
    }
    else {
        monthBox.style.display = 'none';
        yearArrow.textContent = '▼';
        yearBox.style.backgroundColor = 'rgb(56, 166, 240)';
    }
}

