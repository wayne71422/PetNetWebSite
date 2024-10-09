const changePage = (pageName) => {
    pageLink = document.getElementById(pageName);
    if (pageLink != null){
        pageLink.click();
    }
}