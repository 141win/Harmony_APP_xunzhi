@Component
export default struct SearchBar {
  inputText: string = '';

  @Link keyword: string;

  build() {
    Row() {
      // 搜索图标
      Image($rawfile('search.svg'))
        .aspectRatio(1)  // 保持原本形状
        .layoutWeight(0.6)


      // 搜索栏
      TextInput({ placeholder: '请输入搜索关键词' })
        .layoutWeight(8)
        .onChange((value) => { this.keyword = value }) // 保存搜索关键词

      // 点击按钮
      Image($rawfile('benefits.svg'))
        .aspectRatio(1)  // 保持原本形状
        .layoutWeight(1)
        .onClick(() => {
          if (this.inputText.trim() !== '') {
            this.keyword = this.inputText;
          }
        })
    }
  }
}
