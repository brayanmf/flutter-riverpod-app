## lo limitante
en widget
> sera algo tedioso  al crear un nuevo objeto ya que estare llamando al modelo ciertos  para ello esta 
"el statenotifier :]"


```
   onPressed: () {
          ref.read(todosProvider.notifier).update((state) => [...state,Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null,
          )])
   }
```

> ademas al editar 
o eliminar se puede peor es mas codigo 
```  onChanged: ( value ) {
                  // limitante - no poder realizar cambios en el estado tendria q recorrer la lista y cambiar el estado y devolver otra lista
              
                }
                
```