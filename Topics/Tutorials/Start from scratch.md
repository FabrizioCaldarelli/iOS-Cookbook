# Start from scratch

**1. Folders structure:**

All iOS apps should have these packages
```
- Views
- Models
- Libs
- Classes
- ViewsControllers
```

**2. Extend every classes from a Base class:**

For each above packages, create also an inner 'base' package where put:

```
- ViewsControllers/Base/BaseViewController
- Views/Base/BaseView
- Models/Base/BaseModel
```

and you'll extend every new classes from these base class
