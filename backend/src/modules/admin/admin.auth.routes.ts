import { Router } from "express";
import {
  loginAdminController,
  profileAdminController,
  registerAdminController,
} from "./admin.auth.controller.ts";
import { adminMiddleware } from "../../middlewares/admin.middleware.ts";

const router = Router();

router.post("/register", registerAdminController);
router.post("/login", loginAdminController);
router.get("/profile", adminMiddleware, profileAdminController);

const adminAuthRouter = router;

export default adminAuthRouter;
