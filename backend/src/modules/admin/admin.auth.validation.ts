import Joi from "joi";

export const registerAdminSchema = Joi.object({
  name: Joi.string().trim().min(2).required().messages({
    "string.min": "Name must be at least 2 characters",
    "string.empty": "Name is required",
    "any.required": "Name is required",
  }),

  email: Joi.string().trim().email().required().messages({
    "string.email": "Enter a valid email",
    "string.empty": "Email is required",
    "any.required": "Email is required",
  }),

  password: Joi.string().trim().min(4).required().messages({
    "string.min": "Password must be at least 8 characters",
    "string.empty": "Password is required",
    "any.required": "Password is required",
  }),
}).strict();

export const loginAdminSchema = Joi.object({
  email: Joi.string().trim().email().required().messages({
    "string.email": "Enter a valid email",
    "string.empty": "Email is required",
    "any.required": "Email is required",
  }),

  password: Joi.string().trim().min(4).required().messages({
    "string.min": "Password must be at least 8 characters",
    "string.empty": "Password is required",
    "any.required": "Password is required",
  }),
}).strict();
