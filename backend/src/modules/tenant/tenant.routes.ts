import { Router } from "express";
import { validator } from "../../middlewares/validator.ts";
import { createTenantSchema, loginTenantSchema } from "./tenant.validation.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";
import {
  createTenantController,
  loginTenantController,
} from "./tenant.controller.ts";

const router = Router();

router.post(
  "/create",
  validator(createTenantSchema),
  authMiddleware,
  createTenantController,
);

router.post("/login", validator(loginTenantSchema), loginTenantController);

const tenantRouter = router;

export default tenantRouter;
