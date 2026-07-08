import { Router } from "express";
import {
  loginAdminController,
  profileAdminController,
  registerAdminController,
} from "./admin.auth.controller.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";
import {
  loginAdminSchema,
  registerAdminSchema,
} from "./admin.auth.validation.ts";
import { validator } from "../../middlewares/validator.ts";

const router = Router();

router.post(
  "/register",
  validator(registerAdminSchema),
  registerAdminController,
);
router.post("/login", validator(loginAdminSchema), loginAdminController);
router.get("/profile", authMiddleware, profileAdminController);

const adminAuthRouter = router;

export default adminAuthRouter;
