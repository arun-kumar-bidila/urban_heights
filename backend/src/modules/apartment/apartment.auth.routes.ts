import Router from "express";
import {
  createApartmentController,
  fetchApartmentController,
  loginApartmentController,
  fetchSummaryController,
  allApartmentsController,
} from "./apartment.auth.controller.ts";
import { validator } from "../../middlewares/validator.ts";
import {
  createApartmentSchema,
  loginApartmentSchema,
} from "./apartment.auth.validation.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";

const router = Router();

router.post(
  "/create",
  validator(createApartmentSchema),
  createApartmentController,
);
router.post(
  "/login",
  validator(loginApartmentSchema),
  loginApartmentController,
);
router.get("/profile", authMiddleware, fetchApartmentController);

router.get("/summary", authMiddleware, fetchSummaryController);

router.get("/apartments", authMiddleware, allApartmentsController);

const apartmentRouter = router;
export default apartmentRouter;
