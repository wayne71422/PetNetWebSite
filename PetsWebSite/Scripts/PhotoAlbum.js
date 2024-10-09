document.addEventListener('DOMContentLoaded', function () {
    const options = ['選項一', '選項二', '選項三', '選項四', '選項五'];
    const searchInput = document.getElementById('search-input');
    const resultsContainer = document.getElementById('results');

    searchInput.addEventListener('input', () => {
        const query = searchInput.value.toLowerCase();
        resultsContainer.innerHTML = '';

        if (query) {
            const filteredOptions = options.filter(option => option.toLowerCase().includes(query));
            console.log(options);
            filteredOptions.forEach(option => {
                const item = document.createElement('div');
                item.className = 'dropdown-item';
                item.textContent = option;
                item.onclick = () => {
                    searchInput.value += (searchInput.value ? ', ' : '') + option; // 添加選擇的選項
                    resultsContainer.innerHTML = ''; // 清空下拉選單
                    resultsContainer.style.display = 'none'; // 隱藏下拉選單
                };
                resultsContainer.appendChild(item);
            });

            // 如果有過濾結果，顯示下拉選單
            if (filteredOptions.length > 0) {
                resultsContainer.style.display = 'block';
            } else {
                resultsContainer.style.display = 'none'; // 沒有結果時隱藏
            }
        } else {
            resultsContainer.style.display = 'none'; // 如果輸入框為空，隱藏下拉選單
        }
    });

    //
    document.addEventListener('click', (event) => {
        if (!searchInput.contains(event.target) && !resultsContainer.contains(event.target)) {
            resultsContainer.style.display = 'none';
        }
    });
});