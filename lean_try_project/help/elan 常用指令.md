elan 配置 在 settings.toml 查看

```bash
elan --version   # 输出版本号来测试安装是否成功
elan self update # 更新 elan
elan show        # 显示已安装的 Lean 版本

# 下载指定 Lean 版本，所有版本可见 https://github.com/leanprover/lean4/releases
elan install leanprover/lean4:v4.10.0

# 下载最新稳定版本 stable
elan default leanprover/lean4:stable 

# 切换默认的 Lean 版本
# 切换到 leanprover/lean4:v4.11.0-rc1 
elan default leanprover/lean4:v4.11.0-rc1 

# 设置在当前目录下使用的 Lean 版本
elan override set leanprover/lean4:stable
# info: info: override toolchain for 'xxx' set to 'leanprover/lean4:stable'
```

```bash
lake --version # 使用 elan 默认版本
# 使用指定版本
elan run leanprover/lean4:v4.10.0 lake --version
elan run leanprover/lean4:v4.10.0 lean --version
# 创建指定版本的项目
elan run leanprover/lean4:v4.10.0 lake new package
```