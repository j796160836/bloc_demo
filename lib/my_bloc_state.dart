// 抽象狀態
abstract class MyBlocState {}

// 初始狀態
class InitState extends MyBlocState {}

// 微笑狀態
class SmileState extends MyBlocState {}

// 哭泣狀態
class CryingState extends MyBlocState {}

// 錯誤狀態
class ErrorState extends MyBlocState {}