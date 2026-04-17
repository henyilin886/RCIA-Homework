# activate.ps1 - 终端命令行环境激活脚本

$ToolRoot = [Environment]::GetEnvironmentVariable("STM32_TOOL_ROOT", "User")

if (-not $ToolRoot) {
    Write-Host "[-] 错误：未发现 STM32_TOOL_ROOT，请先运行全局安装脚本。" -ForegroundColor Red
} else {
    $CleanRoot = $ToolRoot.Replace('\', '/')
    
    # 将工具路径拼接并置于当前窗口 PATH 的最前面，确保优先级最高
    $env:PATH = "$CleanRoot/gcc/bin;$CleanRoot/cmake/bin;$CleanRoot/ninja;$CleanRoot/openocd/bin;$env:PATH"
    
    Write-Host "================================================" -ForegroundColor Cyan
    Write-Host "  🚀 RCIA电控组终端开发环境已激活！" -ForegroundColor Green
    Write-Host "================================================" -ForegroundColor Cyan
    Write-Host "  [√] GCC 编译器已就绪  (arm-none-eabi-gcc)" -ForegroundColor White
    Write-Host "  [√] CMake 构建系统已就绪 (cmake)" -ForegroundColor White
    Write-Host "  [√] Ninja 加速器已就绪   (ninja)" -ForegroundColor White
    Write-Host "  [√] OpenOCD 烧录工具就绪 (openocd)`n" -ForegroundColor White
    Write-Host "提示：你可以直接输入 'arm-none-eabi-gcc --version' 来测试。" -ForegroundColor Yellow
}