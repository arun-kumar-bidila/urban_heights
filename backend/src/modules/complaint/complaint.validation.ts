import Joi from "joi";

export const createComplaintSchema = Joi.object({
  title: Joi.string().trim().min(2).required().messages({
    "string.min": "title must be at least 2 characters",
    "string.empty": "title is required",
    "any.required": "title is required",
  }),
  description: Joi.string().trim().min(2).required().messages({
    "string.min": "description must be at least 2 characters",
    "string.empty": "description is required",
    "any.required": "description is required",
  }),
  roomId: Joi.string().trim().required().messages({
    "string.empty": "roomId is required",
    "any.required": "roomId is required",
  }),
  apartmentId: Joi.string().trim().required().messages({
    "string.empty": "apartmentId is required",
    "any.required": "apartmentId is required",
  }),
}).strict();
