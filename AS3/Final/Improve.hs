module Improve where
import StatementsExpressions
improve :: Statement -> Statement
lstImprove :: [Statement] -> [Statement]
improveExpr :: Expression -> Expression

improve stmt = case stmt of
  (IfStmt (VarExp "true") s) -> improve s
  (ExpStmt e) -> ExpStmt (improveExpr e)
  (AssignStmt y e) -> AssignStmt y (improveExpr e)
  (IfStmt e s) -> IfStmt (improveExpr e) (improve s)
lstImprove [] = []
lstImprove (x:xs) = (improve x) : (lstImprove xs)
improveExpr expr = case expr of
  (BeginExp [] e) -> improveExpr e
  (EqualsExp e1 e2) -> EqualsExp (improveExpr e1) (improveExpr e2)
  (BeginExp s e) -> BeginExp (lstImprove s) (improveExpr e)
  _ -> expr
