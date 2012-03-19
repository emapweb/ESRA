HoboCKEditor = {
  newEditor : function(elm, buttons) {
    if (elm.name != '') {
      oInstance = CKEDITOR.replace( elm.name ,
      { toolbar : HoboCKEditor.standardToolbarConfig || buttons,
        extraPlugins : 'autogrow',
        uiColor: '#B6C9DA' }
      );
      oInstance.setData( elm.value );
      oInstance.resetDirty();
    }
    return oInstance;
},
makeEditor : function(elm) {
    if (!elm.disabled && !elm.readOnly){
      HoboCKEditor.newEditor(elm);
    }
  },
standardToolbarConfig: [ ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
                    ['Image','SpecialChar'],
                    '/',
                    ['Bold','Italic','Underline','FontSize'],
                    ['NumberedList', 'BulletedList','-','Outdent','Indent','Blockquote'],
                    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'] ]
  }

Hobo.makeHtmlEditor = HoboCKEditor.makeEditor

