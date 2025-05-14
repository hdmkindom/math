# 环境清单

+ ubuntu 22.04
+ vscode 1.99.3
--- 
+ git 2.34.1 
+ elan 4.1.1
+ lean 4.20.0-rc4
# 安装 lean4

## 介绍一下

git 是很常用的版本管理工具

elan 是一个用于管理 LEAN 环境的工具

lake 是 LEAN4 的包管理器

lean 是本体

不建议用官方提供的一行指令 
`wget -q https://raw.githubusercontent.com/leanprover-community/mathlib4/master/scripts/install_debian.sh && bash install_debian.sh ; rm -f install_debian.sh && source ~/.profile`

不知道为什么,我的网络连接不成.即是我;挂了梯子也不行

#### 查找自己系统状态

在安装的时候要根据自己的设备下载对应的版本
使用命令 
```bash
uname -s 

uname -m 
```

## 具体安装的过程

```bash
sudo apt update 安装之前先更新
```
### 1 安装 git

```bash
sudo apt install git
```

应该一下就能用
### 2 安装 elan 4.1.1

#### 为什么 要用 elan 4.1.1 : 
因为 4.1.1 是最新的版本,虽然会担心稳定性问题,但是因为 LEAN4 本来就出来没很长时间,快速发展的情况下,我认为越新的版本管理越往后支持的好.
更重要的是 lean4 作为一个 无"副作用" 语言,不需要考虑出破坏性问题

#### 下载地址
建议去 github elan releases下载

```
https://github.com/leanprover/elan/releases/
```

找 v4.1.1

安装与自己设备对应的版本 
#### 解压与执行
得到一个压缩文件 `elan-x86_64-unknown-linux-gnu.tar.gz` 自己解压得到 elan-init 文件

```bash
chmod +x elan-init  #赋予可执行权限
./elan-init  #执行
```

#### 修改环境变量


`vim .bashrc`

添加 `export PATH="$HOME/.elan/bin:$PATH"` 

#### 检查是否安装成功

```bash
elan -V
```

如果输出:
```bash
❯ elan -V
elan 4.1.1 (1a85ff667 2025-04-30)
```
就说明安装完成

尝试去
```bash
tree .elan -L 2
```
看一下 elan的文件
应该是这样的 没有工具链 `toolchains` 部分,需要我们安装 LEAN4
```bash
.elan
├── bin
│   ├── elan
│   ├── lake
│   ├── lean
│   ├── leanc
│   ├── leanchecker
│   ├── leanmake
│   └── leanpkg
├── env
├── settings.toml
```
### 3 安装lake

lake 作为 lean4 的包管理器,因为过于好用被集合到lean4 的源代码中,所以不需要单独安装

### 4 安装 LEAN4

使用 LEAN4 version 4.20.0-rc4 ,是笔者安装时候的最新版,为什么安装这一版本原因同上

#### 下载地址
通上
```
https://github.com/leanprover/lean4/releases?page=1
```

找 [v4.20.0-rc4](https://github.com/leanprover/lean4/releases/tag/v4.20.0-rc4)

#### 解压

通上

得到的是一个文件 `lean-4.20.0-rc4-linux` 

将这个文件粘贴到 `.elan/toolchains/` 下面,目的是给他找个安全点不容易被删除的位置,实际上这个位置随意

#### elan toolchains 链接 到目标LEAN4

```bash
elan toolchain link leanprover/lean4:v4.20.0-rc4 /home/hdm/.elan/toolchains/lean-4.20.0-rc4-linux
```

将其设置为默认使用版本

```bash
elan default leanprover/lean4:v4.20.0-rc4
```

#### 检查是否安装成功

```bash
lean --version
```

打印出来应该是

```bash
Lean (version 4.20.0-rc4, x86_64-unknown-linux-gnu, commit e65f5f118a60, Release)
```

### 5 安装 vscode

去官网下载,不要用 apt,避免不必要麻烦

安装核心拓展 : lean4

安装完成之后就可以在右上角看到 任意 $\forall$ 符号

在 vscode 中编写代码
# 简单使用

## 创建工作目录 

cd 到想要去的目录
```bash
lake new lean_try_project
```
创建了一个 叫做 `hello` 的目录,里面有我们的工作空间,

```bash
tree 
.
├── lakefile.toml
├── lake-manifest.json
├── lean-toolchain
├── LeanTryProject
│   └── Basic.lean
├── LeanTryProject.lean
├── Main.lean
└── README.md

```

#### 1. lakefile.toml 
- **简介**：这是 Lake 的配置文件，定义了项目的构建设置和依赖关系。
- **内容**： 项目的名称、版本和描述。 - 依赖的库和模块。 - 构建选项和其他配置参数。 
####  2. lake-manifest.json
- **简介**：这个文件记录了项目的依赖关系和版本信息。 
- **内容**： 列出了所有依赖的包及其版本。 - 用于确保在不同环境中构建项目时，使用一致的依赖版本。 
#### 3. lean-toolchain 
- **简介**：这是一个文件，指定了项目使用的 Lean 版本。
- **内容**： 包含 Lean 的版本信息，确保项目在特定版本的 Lean 环境中运行。 
#### 4. LeanTryProject 目录 
- **简介**：这是项目的主要代码目录，包含 Lean 源代码文件。 
- **内容**： **Basic.lean**：这是一个示例 Lean 文件，通常包含基本的 Lean 代码和示例，供开发者参考和学习。 
#### 5. LeanTryProject.lean 
- **简介**：这是项目的主 Lean 文件，通常用于定义项目的主要逻辑或模块。 
- **内容**： 包含项目的核心代码，可能会引入其他 Lean 文件或模块。 
#### 6. Main.lean 
- **简介**：这是项目的入口文件。 
- **内容**： 包含程序的主函数或主要逻辑，用于启动项目的执行。 
#### 7. README.md 
- **简介**：这是项目的说明文件，提供项目信息和使用指南。 
- **内容**： 项目的简介、功能和目的。 - 如何安装和运行项目的说明。 - 贡献指南和许可证信息。
-- from gpt4o mini

## 流程
在工作目录下

```bash
# 修改 lakefile.toml 添加依赖,.无就省略

lake install # 安装依赖

lake build  # 构建包

lake run # 运行项目,执行的 Main.lean 中代码

lake update # 更新依赖

lake clean # 清理构建文件
```

感谢观看,有任何问题请联系 : hdm1300415778@gmail.com

