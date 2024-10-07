function addItem() {
    const taskInput = document.getElementById("taskInput");
    const newTask = document.getElementById("newTask");
    const itemList = document.getElementById("itemList");

    newTask.addEventListener('click', () => {
      const itemValue = taskInput.value;
      if (itemValue.trim() !== '') {
        const listItem = document.createElement('li');
        listItem.textContent = itemValue;

        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Delete';

        deleteButton.addEventListener('click', () => {
          listItem.remove();
        });

        listItem.appendChild(deleteButton);
        itemList.appendChild(listItem);

        taskInput.value = '';
       
        taskInput.focus();   

      }
    });
  }
