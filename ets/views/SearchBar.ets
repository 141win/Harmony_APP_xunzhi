

@Component
export default struct SearchBar{
   inputText: string = '';
   @Prop onSearch: (value: string) => void  // 通过Props传递回调函数

  build() {
    Row() {
      //  搜索图标
      Image($r('app.media.search'))
        .aspectRatio(1)  // 保持原本形状
        .layoutWeight(0.6)

      //  搜索栏
      TextInput({placeholder: '请输入搜索关键词'})
        .layoutWeight(8)
        // 保存搜索关键词
        .onChange((value) => { this.inputText = value })


      // 点击按钮
      Image($r('app.media.benefits'))
        .aspectRatio(1)  // 保持原本形状
        .layoutWeight(1)
        .onClick(() => {
            if(this.inputText.trim() !== ''){
              //this.onSearch(this.inputText);
              // console.log(this.inputText);
            }
        })
    }
  }

}