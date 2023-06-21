﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestWorldApp.Models
{
    public class Basket
    {
        /// <summary>
        /// Value словаря - количество товара и стоимость
        /// </summary>
        public struct BuyItem
        {
            public int Count { get; set; }
            public double Total { get; set; }
        }
        /// <summary>
        /// Словарь хранит товар в качестве ключа и BuyItem в качестве значения
        /// </summary>
        public static Dictionary<Pricelist, BuyItem> GetBasket { get; } = new Dictionary<Pricelist, BuyItem>();

        // очистка корзины
        public static void ClearBasket()
        {
            GetBasket.Clear();
        }
        /// <summary>
        /// Добавление товара в корзину
        /// </summary>
        /// <param name="product">Добавляемый товар</param>
        public static void AddProductInBasket(Pricelist product)
        {
            // если такой товар есть в корзине
            if (GetBasket.ContainsKey(product))
            {
                // увеличиваем его количество на +1
                int k = GetBasket[product].Count + 1;
                // пересчистваем стоимость
                double p = Convert.ToDouble(product.Price) * k;
                GetBasket[product] = new BuyItem { Count = k, Total = p };
            }
            else
            {
                // добавляем новый товар в корзину в количесьве 1 шт
                double p = Convert.ToDouble(product.Price);
                GetBasket[product] = new BuyItem { Count = 1, Total = p };
            }
        }
        /// <summary>
        /// Изменяет количество товара product в корзине
        /// </summary>
        /// <param name="product">Товар</param>
        /// <param name="count">количество товара</param>
        public static void SetCount(Pricelist product, int count)
        {
            if (GetBasket.ContainsKey(product))
            {
                int k = count;
                double p = Convert.ToDouble(product.Price) * k;
                GetBasket[product] = new BuyItem { Count = k, Total = p };
                // если количество 0 или меньше 0 удаляем товар из корзины
                if (k <= 0)
                {
                    GetBasket.Remove(product);
                }
            }
        }

        /// <summary>
        /// Удаляем товар product из корзины
        /// </summary>
        /// <param name="product">Удаляемый товар</param>
        public static void DeleteProductFromBasket(Pricelist product)
        {
            if (GetBasket.ContainsKey(product))
            {
                GetBasket.Remove(product);
            }
        }

        /// <summary>
        /// Cтоимость всех товаров в корзине
        /// </summary>
        public static double GetTotalCost
        {
            get
            {
                double sum = 0;
                foreach (var item in GetBasket)
                {
                    sum += item.Value.Total;
                }
                return sum;
            }
        }
        /// <summary>
        /// Количество товаров в корзине
        /// </summary>
        public static int GetCount
        {
            get
            {
                return GetBasket.Count;
            }
        }

      
       
    }
}
