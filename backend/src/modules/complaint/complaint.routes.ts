import { Router } from "express";
import { createComplaintSchema } from "./complaint.validation.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";
import {
  createComplaintController,
  fetchComplaintsByApartmentController,
} from "./complaint.controller.ts";
import { validator } from "../../middlewares/validator.ts";

const router = Router();

router.post(
  "/create",
  validator(createComplaintSchema),
  authMiddleware,
  createComplaintController,
);

router.get("/fetch", authMiddleware, fetchComplaintsByApartmentController);

const complaintRouter = router;

export default complaintRouter;
