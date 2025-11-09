/**
 * @kind problem
 * @id demo/java/localvar-hardcoded-password
 * @name Hardcoded password (LocalVariableDecl)
 * @description Detect local variable declarations that contain a hardcoded password.
 * @tags security
 */

import java


from LocalVariableDecl v, RefType t, StringLiteral lit
where
  v.getInitializer() = lit and
  v.getType() = t and
  t.hasQualifiedName("java.lang", "String") and
  v.getName().regexpMatch("(?i)password")
select v, "Hardcoded password: " + lit.getValue()



// from LocalVariableDecl v, StringLiteral s
// where
//   v.getName().regexpMatch("(?i).*pass(word)?|pwd.*") //and
//   //v.getInitializer() = s and
//   //s.getValue().length() > 0
// select v, "Variable '" + v.getName() +
//           "' is initialized with a hardcoded password: \"" + s.getValue() + "\"."

//e1 = a and
//a.getSource() = s1 and                    // 右边确实是字符串字面量 => 常量
// 左侧变量名（文本）含 pass/password/pwd，忽略大小写；右值非空 AssignExpr
