document.addEventListener('DOMContentLoaded', () => {
    let flash = document.querySelector('.flash');

    window.setTimeout( function() {
        flash.remove('class');
    }, 3000);
});