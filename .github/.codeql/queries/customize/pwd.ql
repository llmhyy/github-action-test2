/**
 * @id java/hardcoded-password
 * @kind problem
 * @problem.severity error
 * @language java
 * @description Detect hardcoded passwords in variable declarations.
 */

import java

from LocalVariableDecl v, StringLiteral s
where
  // 变量名包含 password（忽略大小写）
  v.getName().matches("(?i).*password.*") and
  // 初始化表达式是字符串常量
  v.getInitializer() = s and
  s.getValue().length() > 0
select v, "Variable '" + v.getName() +
          "' is initialized with a hardcoded password: \"" + s.getValue() + "\"."
