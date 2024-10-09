document.addEventListener('DOMContentLoaded', function() {
    const saveBtn = document.getElementById('saveBtn');
    const newPetForm = document.getElementById('newPetForm');
    const newPetModal = document.getElementById('newPetModal');

    saveBtn.addEventListener('click', function() {
        if (newPetForm.checkValidity()) {
            const newPetName = document.getElementById('newPetName').value;
            const newBday = document.getElementById('newBday').value;
            let newType = document.getElementById('newType').value;
            newType = newType == 'cat' ? '貓' : '狗';
            const newSpecies = document.getElementById('newSpecies').value;
            let newGender = document.getElementById('newGender').value;
            newGender = newGender == 'M' ? '公' : '母';
            let newLigation = document.getElementById('newLigation').value;
            newLigation = newLigation == 'Y' ? '是' : '否';
            const newWeight = document.getElementById('newWeight').value;
            const petData = {
                name: newPetName,
                bday: newBday,
                type: newType,
                species: newSpecies,
                gender: newGender,
                ligation: newLigation,
                weight: newWeight
            }
            console.log(petData);
            // 這裡可以添加保存日記的邏輯
            createPetBlock(petData);

            // 關閉 Modal
            document.getElementById('closeModalBtn').click();

            // 重置表單
            newPetForm.reset();
            document.getElementById('newSpecies').innerHTML = '';
        } else {
            newPetForm.reportValidity();
        }
    });
});

const catList = ['米克斯', '波斯貓', '俄羅斯藍貓', '喜馬拉雅貓', '土耳其安哥拉貓', '土耳其梵貓', '布偶貓', '阿比西尼亞貓', '蘇格蘭折耳貓', '美國短毛貓', '埃及貓', '英國短毛貓', '異國短毛貓', '其他'];
const dogList = ['米克斯', '吉娃娃', '博美犬', '約克夏', '馬爾濟斯', '臘腸犬', '貴賓犬', '法國鬥牛犬', '比熊犬', '西施犬', '迷你雪納瑞', '狐狸犬', '巴哥犬', '西高地白梗', '柴犬', '柯基', '拉不拉多', '黃金獵犬', '哈士奇', '沙皮犬', '杜賓犬', '大丹犬', '其他'];

const onTypeChange = () => {
    const newSpecies = document.getElementById('newSpecies');
    newSpecies.innerHTML = '';
    const newType = document.getElementById('newType').value;
    if (newType == '') return;
    const list = newType == 'cat' ? catList : dogList;
    list.forEach(member => {
        let option = document.createElement('option');
        option.textContent = member;
        newSpecies.appendChild(option);
    })
}

const createPetBlock = (petData) => {
    const petList = document.querySelector('.pet-list');
    const container = document.createElement('div');
    container.className = 'container-md';

    const row = document.createElement('div');
    row.className = 'row';
    
    const col1 = document.createElement('div');
    col1.className = 'col-md-5';
    const pic = document.createElement('img');
    pic.src = './img/footprint.png';
    pic.className = 'img-fluid';
    col1.appendChild(pic);

    const col2 = document.createElement('div');
    col2.className = 'col-md-7';
    const profile = document.createElement('table');
    profile.className = 'text-center';
    const tbody = document.createElement('tbody');
    const headers = ['寵物名', '生日', '種類', '品種', '性別', '結紮', '體重(公斤)'];
    const keys = ['name', 'bday', 'type', 'species', 'gender', 'ligation', 'weight'];
    keys.forEach((key, index) => {
        const trow = document.createElement('tr');
        const theader = document.createElement('th');
        theader.scope = 'row';
        theader.textContent = headers[index];
        const tdata = document.createElement('td');
        tdata.textContent = petData[key];
        trow.append(theader, tdata);
        tbody.appendChild(trow);
    })
    profile.appendChild(tbody);
    const btns = document.createElement('div');
    btns.className = 'btns';
    const btnsName = ['編輯', '活動日記', '預約諮詢']
    btnsName.forEach(name => {
        const btn = document.createElement('button');
        btn.textContent = name
        btns.appendChild(btn);
    })
    col2.append(profile, btns);
    row.append(col1, col2);
    container.appendChild(row);
    petList.appendChild(container);

}

