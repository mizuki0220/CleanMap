document.addEventListener('DOMContentLoaded', function () {
  const maxFileCount = 3;
  const fileInput = document.querySelector('#images');

  fileInput.addEventListener('change', function () {
    if (fileInput.files.length > maxFileCount) {
      alert(`最大で ${maxFileCount} 枚までしか選択できません。`);
      fileInput.value = '';
    }
  });
});

